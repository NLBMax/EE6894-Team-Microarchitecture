
#include "sst_config.h"
#include "smoothingprefetch.h"

#include <vector>
#include <stdlib.h>
#include <deque>

#include "sst/core/params.h"
#include "sst/elements/memHierarchy/memEvent.h"
#include "sst/elements/memHierarchy/cacheListener.h"

using namespace SST;
using namespace SST::MemHierarchy;

namespace SST {
namespace Cassini {

SESPrefetcher::SESPrefetcher(ComponentId_t id, Params& params) 
    : CacheListener(id, params), alpha(params.find<double>("smoothing_factor", 0.5)) {

    requireLibrary("memHierarchy");

    blockSize = params.find<uint64_t>("cache_line_size", 64);
    verbosity = params.find<int>("verbose", 0);

    // Setting up output for logging with a unique identifier
    char* new_prefix = (char*) malloc(sizeof(char) * 128);
    snprintf(new_prefix, sizeof(char)*128, "SESPrefetcher[%s | @f:@p:@l] ", getName().c_str());
    output = new Output(new_prefix, verbosity, 0, Output::STDOUT);
    free(new_prefix);

    // Initialize statistics
    statPrefetchEventsIssued = registerStatistic<uint64_t>("prefetches_issued");
    statMissEventsProcessed  = registerStatistic<uint64_t>("miss_events_processed");
    statHitEventsProcessed   = registerStatistic<uint64_t>("hit_events_processed");

    // Initialize address tracking
    lastPredictedAddr = 0;
    lastAccessAddr = 0;

    output->verbose(CALL_INFO, 1, 0, "SESPrefetcher created, cache line size: %" PRIu64 "\n", blockSize);
}

SESPrefetcher::~SESPrefetcher() {}

void SESPrefetcher::notifyAccess(const CacheListenerNotification& notify) {
    const NotifyAccessType notifyType = notify.getAccessType();
    const NotifyResultType notifyResType = notify.getResultType();
    const Addr addr = notify.getPhysicalAddress();

    // Only process read or write events
    if (notifyType != READ && notifyType != WRITE) return;

    // Process cache hit or miss
    if (notifyResType == MISS) {
        statMissEventsProcessed->addData(1);

        // Calculate the next predicted address using Single Exponential Smoothing
        Addr predictedAddr = alpha * addr + (1 - alpha) * lastPredictedAddr;
        predictedAddr = (predictedAddr / blockSize) * blockSize;  // Align to cache line

        // Update the tracking variables
        lastPredictedAddr = predictedAddr;
        lastAccessAddr = addr;

        statPrefetchEventsIssued->addData(1);

        output->verbose(CALL_INFO, 2, 0, "Prefetching address: %" PRIx64 "\n", predictedAddr);

        // Issue prefetch for the predicted address
        for (auto* callback : registeredCallbacks) {
            MemEvent* newEv = new MemEvent(getName(), predictedAddr, predictedAddr, Command::GetS);
            newEv->setSize(blockSize);
            newEv->setPrefetchFlag(true);
            (*callback)(newEv);
        }
    } else {
        statHitEventsProcessed->addData(1);
        lastAccessAddr = addr;
    }
}

void SESPrefetcher::registerResponseCallback(Event::HandlerBase* handler) {
    registeredCallbacks.push_back(handler);
}

void SESPrefetcher::printStats(Output& out) {
    out.output("Single Exponential Smoothing Prefetcher Statistics:\n");
    out.output("    Prefetches Issued: %llu\n", statPrefetchEventsIssued->getCollectionCount());
    out.output("    Miss Events Processed: %llu\n", statMissEventsProcessed->getCollectionCount());
    out.output("    Hit Events Processed: %llu\n", statHitEventsProcessed->getCollectionCount());
}

} // namespace Cassini
} // namespace SST
