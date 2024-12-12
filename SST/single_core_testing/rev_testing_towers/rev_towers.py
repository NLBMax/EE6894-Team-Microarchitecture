import os
import sst

# Define SST core options
#sst.setProgramOption("timebase", "1ps")

# Define the simulation components
# comp_cpu = sst.Component("cpu", "miranda.BaseCPU")
# comp_cpu.addParams({
#         "verbose" : 0,
#         "clock" : "2.4GHz",
# })

# gen = comp_cpu.setSubComponent("generator", "miranda.Stake")
# gen.addParams({
#     "verbose" : 0,
#     "log" : "false",
#     "cores" : 1,
#     "mem_size" : "2048",
#     "pc" : "0x80000000",
#     "isa" : "RV64IMAFDC",
#     "proxy_kernel" : "pk",
#     "bin" : "./mult.mem",
#     "args" : "",
#     "ext" : "",
#     "extlib" : ""
# })


DEBUG_L1 = 1
DEBUG_MEM = 10
DEBUG_LEVEL = 10
VERBOSE = 10
MEM_SIZE = 1024*1024*1024-1

# Define the simulation components
comp_cpu = sst.Component("cpu", "revcpu.RevCPU")
comp_cpu.addParams({
        "verbose" : 10,                                # Verbosity
        "numCores" : 1,                               # Number of cores
        "clock" : "2.0GHz",                           # Clock
        "memSize" : MEM_SIZE,                         # Memory size in bytes
        "machine" : "[0:rv64imafd]",              # Core:Config; RV64G for core 0
        "startAddr" : "[0:0x00000000]",               # Starting address for core 0
        "memCost" : "[0:1:10]",                       # Memory loads required 1-10 cycles
        "program" : os.getenv("REV_EXE", "towers.exe"),  # Target executable
        "enable_memH" : 1,                            # Enable memHierarchy support
        "splash" : 1                              # Display the splash message
})
comp_cpu.enableAllStatistics()

# Create the RevMemCtrl subcomponent
comp_lsq = comp_cpu.setSubComponent("memory", "revcpu.RevBasicMemCtrl");
comp_lsq.addParams({
      "verbose"         : "10",
      "clock"           : "2.0Ghz",
      "max_loads"       : 64,
      "max_stores"      : 64,
      "max_flush"       : 64,
      "max_llsc"        : 64,
      "max_readlock"    : 64,
      "max_writeunlock" : 64,
      "max_custom"      : 64,
      "ops_per_cycle"   : 64
})

# Tell SST what statistics handling we want
sst.setStatisticLoadLevel(4)

# Enable statistics outputs
comp_cpu.enableAllStatistics({"type":"sst.AccumulatorStatistic"})

# L1 cache
comp_l1cache = sst.Component("l1cache", "memHierarchy.Cache")
comp_l1cache.addParams({
      "access_latency_cycles" : "2",
      "cache_frequency" : "2.4 GHz",
      "tag_access_latency_cycles" : 1,
      "replacement_policy" : "lru",
      "coherence_protocol" : "MESI",
      "associativity" : "8",
      "cache_line_size" : "64",
      "prefetcher" : "cassini.NextBlockPrefetcher",
      #"debug" : "1",
      "L1" : "1",
      "cache_size" : "32KB"
})
iface = comp_lsq.setSubComponent("memIface", "memHierarchy.standardInterface")
iface.addParams({
      "verbose" : VERBOSE
})
# Enable statistics outputs
comp_l1cache.enableAllStatistics({"type":"sst.AccumulatorStatistic"})
cpu_l1_link = sst.Link("link_cpu_cache1_")
cpu_l1_link.connect ( (iface, "port", "500ps"), (comp_l1cache, "high_network_0", "500ps") )


# L2 cache
comp_l2cache = sst.Component("l2cache", "memHierarchy.Cache")
comp_l2cache.addParams({
   "cache_frequency" : "2.4 GHz",
        "access_latency_cycles" : "4",
        "tag_access_latency_cycles" : 2,
        "mshr_latency_cycles" : 4,
        "replacement_policy" : "nmru",
        "coherence_protocol" : "MESI",
        "cache_size" : "512KB",
        "associativity" : 8,
        "max_requests_per_cycle" : 1,
        "mshr_num_entries" : 8,
        "prefetcher" : "cassini.NextBlockPrefetcher",
        #"drop_prefetch_mshr_level" : 5, # Drop prefetch when total misses > 5
})

l1_l2_link = sst.Link("link_l1_l2_")
l1_l2_link.connect( (comp_l1cache, "low_network_0", "100ps"), (comp_l2cache, "high_network_0", "100ps") )
comp_l2cache.enableAllStatistics({"type":"sst.AccumulatorStatistic"})

# L3 cache
comp_l3cache = sst.Component("l3cache", "memHierarchy.Cache")
comp_l3cache.addParams({
    "cache_frequency" : "2.4 GHz",
    "access_latency_cycles" : 12,
    "tag_access_latency_cycles" : 6,
    "mshr_latency_cycles" : 12,
    "replacement_policy" : "random",
    "coherence_protocol" : "MESI",
    "cache_size" : "40KiB",
    "associativity" : 2,
    "prefetcher" : "cassini.StridePrefetcher",
    "mshr_num_entries" : 8,
})


l2_l3_link = sst.Link("link_l2_l3_")
l2_l3_link.connect ( (comp_l2cache, "low_network_0", "500ps"), (comp_l3cache, "high_network_0", "500ps") )

# L4 cache
comp_l4cache = sst.Component("l4cache", "memHierarchy.Cache")
comp_l4cache.addParams({
    "cache_frequency" : "2.4 GHz",
    "access_latency_cycles" : 63,
    "tag_access_latency_cycles" : 6,
    "mshr_latency_cycles" : 12,
    "replacement_policy" : "random",
    "coherence_protocol" : "MESI",
    "cache_size" : "16MiB",
    "prefetcher" : "cassini.NextBlockPrefetcher",
    "associativity" : 16,
    "mshr_num_entries" : 8,
})


l3_l4_link = sst.Link("link_l3_l4_")
l3_l4_link.connect ( (comp_l3cache, "low_network_0", "500ps"), (comp_l4cache, "high_network_0", "500ps") )



# Main Memory

memctrl = sst.Component("memory", "memHierarchy.MemController")
memctrl.addParams({
    "debug" : DEBUG_MEM,
    "debug_level" : DEBUG_LEVEL,
    "clock" : "2GHz",
    "verbose" : VERBOSE,
    "addr_range_start" : 0,
    "addr_range_end" : MEM_SIZE,
    "backing" : "malloc"
})
memory = memctrl.setSubComponent("backend", "memHierarchy.simpleMem")
memory.addParams({
     "access_time" : "100ns",
    "mem_size" : "8GB"
})
comp_l3cache.enableAllStatistics({"type":"sst.AccumulatorStatistic"})
comp_l4cache.enableAllStatistics({"type":"sst.AccumulatorStatistic"})

link_directory_L3Cache = sst.Link("link_directory_L3Cache")
link_directory_L3Cache.connect( (comp_l4cache, "low_network_0", "50ps"), (memctrl, "direct_link", "50ps") )
