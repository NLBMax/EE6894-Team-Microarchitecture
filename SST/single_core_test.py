import sst

# Define SST core options
#sst.setProgramOption("timebase", "1ps")

# Define the simulation components
comp_cpu = sst.Component("cpu", "miranda.BaseCPU")
comp_cpu.addParams({
        "verbose" : 0,
        "clock" : "2.4GHz",
        #"commFreq" : 4, # issue request every 4th cycle
        #"rngseed" : 99,
        #"do_write" : 1,
        #"num_loadstore" : 1500,
        #"addressoffset" : 1024, # Stream between addresses 1024 & 16384
        #"memSize" : 1024*4
})

cpugen = comp_cpu.setSubComponent("generator", "miranda.GUPSGenerator")
cpugen.addParams({
        "iterations" : 100,
        "count" : 1000,
        "reqLength" : 16,
        "memStart" : 0,
        "memLength" : "512MB",
        "seed_a" : 11,
        "seed_b" : 31,
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
      "prefetcher" : "cassini.StridePrefetcher",
      #"debug" : "1",
      "L1" : "1",
      "cache_size" : "32KB"
})
iface = comp_cpu.setSubComponent("memory", "memHierarchy.standardInterface")
# Enable statistics outputs
comp_l1cache.enableAllStatistics({"type":"sst.AccumulatorStatistic"})
cpu_l1_link = sst.Link("link_cpu_cache1_")
cpu_l1_link.connect ( (iface, "port", "500ps"), (comp_l1cache, "high_network_0", "500ps") )


# L2 cache
comp_l2cache = sst.Component("l2cache", "memHierarchy.Cache")
comp_l2cache.addParams({
   "cache_frequency" : "2.4 GHz",
        "access_latency_cycles" : 14,
        "tag_access_latency_cycles" : 2,
        "mshr_latency_cycles" : 4,
        "replacement_policy" : "lru",
        "coherence_protocol" : "MESI",
        "cache_size" : "512KB",
        "associativity" : 8,
        "max_requests_per_cycle" : 1,
        "mshr_num_entries" : 8,
        "prefetcher" : "cassini.StridePrefetcher",
        #"drop_prefetch_mshr_level" : 5, # Drop prefetch when total misses > 5
})

l1_l2_link = sst.Link("link_l1_l2_")
l1_l2_link.connect( (comp_l1cache, "low_network_0", "100ps"), (comp_l2cache, "high_network_0", "100ps") )
comp_l2cache.enableAllStatistics({"type":"sst.AccumulatorStatistic"})

# L3 cache
comp_l3cache = sst.Component("l3cache", "memHierarchy.Cache")
comp_l3cache.addParams({
    "cache_frequency" : "2.4 GHz",
    "access_latency_cycles" : 63,
    "tag_access_latency_cycles" : 6,
    "mshr_latency_cycles" : 12,
    "replacement_policy" : "nmru",
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
    "replacement_policy" : "nmru",
    "coherence_protocol" : "MESI",
    "cache_size" : "16MiB",
    "prefetcher" : "cassini.StridePrefetcher",
    "associativity" : 16,
    "mshr_num_entries" : 8,
})


l3_l4_link = sst.Link("link_l3_l4_")
l3_l4_link.connect ( (comp_l3cache, "low_network_0", "500ps"), (comp_l4cache, "high_network_0", "500ps") )



# Main Memory

memctrl = sst.Component("memory", "memHierarchy.MemController")
memctrl.addParams({
    "clock" : "500MHz",
    "backing" : "none",
    "addr_range_start" : 0,
})
memory = memctrl.setSubComponent("backend", "memHierarchy.simpleMem")
memory.addParams({
    "max_requests_per_cycle" : 2,
    "mem_size" : "1GiB",
    "access_time" : "50ns",

})
comp_l3cache.enableAllStatistics({"type":"sst.AccumulatorStatistic"})
comp_l4cache.enableAllStatistics({"type":"sst.AccumulatorStatistic"})

link_directory_L3Cache = sst.Link("link_directory_L3Cache")
link_directory_L3Cache.connect( (comp_l4cache, "low_network_0", "50ps"), (memctrl, "direct_link", "50ps") )
