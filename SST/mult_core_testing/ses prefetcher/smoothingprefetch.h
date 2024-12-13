
#ifndef _H_SST_SES_PREFETCH
#define _H_SST_SES_PREFETCH

#include <vector>
#include <unordered_map>
#include <sst/core/event.h>
#include <sst/core/sst_types.h>
#include <sst/core/component.h>
#include <sst/core/link.h>
#include <sst/core/timeConverter.h>
#include <sst/elements/memHierarchy/memEvent.h>
#include <sst/elements/memHierarchy/cacheListener.h>
#include <sst/core/output.h>

using namespace SST;
using namespace SST::MemHierarchy;
using namespace std;

namespace SST {
namespace Cassini {

class SESPrefetcher : public SST::MemHierarchy::CacheListener {
public:
    SESPrefetcher(ComponentId_t id, Params& params);
    ~SESPrefetcher();

    void notifyAccess(const CacheListenerNotification& notify);
    void registerResponseCallback(Event::HandlerBase *handler);
    void printStats(Output& out);

    SST_ELI_REGISTER_SUBCOMPONENT(
        SESPrefetcher,
        "cassini",
        "SESPrefetcher",
        SST_ELI_ELEMENT_VERSION(1,0,0),
        "Single Exponential Smoothing Prefetcher",
        SST::MemHierarchy::CacheListener
    )

    SST_ELI_DOCUMENT_PARAMS(
        { "verbose", "Controls the verbosity of the Cassini component", "0" },
        { "cache_line_size", "Size of the cache line the prefetcher is attached to", "64" },
        { "smoothing_factor", "Smoothing factor (alpha) for exponential smoothing prediction", "0.5" }
    )

    SST_ELI_DOCUMENT_STATISTICS(
        { "prefetches_issued", "Number of prefetch requests issued", "prefetches", 1 },
        { "miss_events_processed", "Number of cache misses received", "misses", 1 },
        { "hit_events_processed", "Number of cache hits received", "hits", 1 }
    )

private:
    Output* output;
    std::vector<Event::HandlerBase*> registeredCallbacks;
    uint64_t blockSize;
    double alpha;                  // Smoothing factor for SES prediction
    Addr lastPredictedAddr;        // Last predicted address based on SES
    Addr lastAccessAddr;           // Last accessed address
    uint32_t verbosity;

    Statistic<uint64_t>* statPrefetchEventsIssued;
    Statistic<uint64_t>* statMissEventsProcessed;
    Statistic<uint64_t>* statHitEventsProcessed;
};

} // namespace Cassini
} // namespace SST

#endif
