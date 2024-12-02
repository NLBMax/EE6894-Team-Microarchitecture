import sst

# Define SST core options
# sst.setProgramOption("timebase", "1ps")

# Define the simulation components
comp_cpu = sst.Component("cpu", "miranda.BaseCPU")
comp_cpu.addParams({
    "verbose": 0,
    "clock": "2.4GHz",
})

cpugen = comp_cpu.setSubComponent("generator", "miranda.GUPSGenerator")
cpugen.addParams({
    "iterations": 100,
    "count": 1000,
    "reqLength": 16,
    "memStart": 0,
    "memLength": "512MB",
    "seed_a": 10,
    "seed_b": 10,
})

sst.setStatisticLoadLevel(5)
comp_cpu.enableAllStatistics({"type": "sst.AccumulatorStatistic"})

# L1 cache
comp_l1cache = sst.Component("l1cache", "memHierarchy.Cache")
comp_l1cache.addParams({
    "access_latency_cycles": "2",
    "cache_frequency": "2.4 GHz",
    "tag_access_latency_cycles": 1,
    "replacement_policy": "lru",
    "coherence_protocol": "MESI",
    "associativity": "8",
    "cache_line_size": "64",
    "prefetcher": "cassini.SESPrefetcher",
    "L1": "1",
    "cache_size": "32KB"
})
iface = comp_cpu.setSubComponent("memory", "memHierarchy.standardInterface")
comp_l1cache.enableAllStatistics({"type": "sst.AccumulatorStatistic"})

cpu_l1_link = sst.Link("link_cpu_cache1_")
cpu_l1_link.connect((iface, "port", "500ps"), (comp_l1cache, "high_network_0", "500ps"))

# L2 cache
comp_l2cache = sst.Component("l2cache", "memHierarchy.Cache")
comp_l2cache.addParams({
    "cache_frequency": "2.4 GHz",
    "access_latency_cycles": 14,
    "tag_access_latency_cycles": 2,
    "mshr_latency_cycles": 4,
    "replacement_policy": "lru",
    "coherence_protocol": "MESI",
    "cache_size": "512KB",
    "associativity": 8,
    "max_requests_per_cycle": 1,
    "mshr_num_entries": 8,
    "prefetcher": "cassini.SESPrefetcher",
})

l1_l2_link = sst.Link("link_l1_l2_")
l1_l2_link.connect((comp_l1cache, "low_network_0", "100ps"), (comp_l2cache, "high_network_0", "100ps"))
comp_l2cache.enableAllStatistics({"type": "sst.AccumulatorStatistic"})

# Bus component to connect L2, L3, and L4 in parallel
bus = sst.Component("bus", "memHierarchy.Bus")
bus.addParams({
    "bus_frequency": "2.4GHz",
    # If supported, configure routing to balance traffic between L3 and L4
    # "routing_policy": "round_robin"  # Example policy if available
})

# Connect L2 to Bus
l2_bus_link = sst.Link("link_l2_bus_")
l2_bus_link.connect((comp_l2cache, "low_network_0", "500ps"), (bus, "high_network_0", "500ps"))

# L3 cache component connected in parallel
comp_l3cache = sst.Component("l3cache", "memHierarchy.Cache")
comp_l3cache.addParams({
    "cache_frequency": "2.4 GHz",
    "access_latency_cycles": 63,
    "tag_access_latency_cycles": 6,
    "mshr_latency_cycles": 12,
    "replacement_policy": "lru",
    "coherence_protocol": "MESI",
    "cache_size": "40KiB",
    "associativity": 2,
    "prefetcher": "cassini.SESPrefetcher",
    "mshr_num_entries": 8,
})

# L4 cache component connected in parallel
comp_l4cache = sst.Component("l4cache", "memHierarchy.Cache")
comp_l4cache.addParams({
    "cache_frequency": "2.4 GHz",
    "access_latency_cycles": 63,
    "tag_access_latency_cycles": 6,
    "mshr_latency_cycles": 12,
    "replacement_policy": "lru",
    "coherence_protocol": "MESI",
    "cache_size": "16MiB",
    "prefetcher": "cassini.SESPrefetcher",
    "associativity": 16,
    "mshr_num_entries": 8,
})

# Connect Bus to L3 and L4 in parallel
bus_l3_link = sst.Link("link_bus_l3_")
bus_l3_link.connect((bus, "low_network_1", "500ps"), (comp_l3cache, "high_network_0", "500ps"))

bus_l4_link = sst.Link("link_bus_l4_")
bus_l4_link.connect((bus, "low_network_0", "500ps"), (comp_l4cache, "high_network_0", "500ps"))

comp_l3cache.enableAllStatistics({"type": "sst.AccumulatorStatistic"})
comp_l4cache.enableAllStatistics({"type": "sst.AccumulatorStatistic"})

# Main Memory Bus to connect both L3 and L4 to the Memory Controller
mem_bus = sst.Component("mem_bus", "memHierarchy.Bus")
mem_bus.addParams({
    "bus_frequency": "2.4GHz"
})

# Connect both L3 and L4 to Memory Bus independently
l3_mem_bus_link = sst.Link("link_l3_mem_bus_")
l3_mem_bus_link.connect((comp_l3cache, "low_network_0", "50ps"), (mem_bus, "high_network_1", "50ps"))

l4_mem_bus_link = sst.Link("link_l4_mem_bus_")
l4_mem_bus_link.connect((comp_l4cache, "low_network_0", "50ps"), (mem_bus, "high_network_0", "50ps"))

# Memory Controller
memctrl_1 = sst.Component("memory", "memHierarchy.MemController")
memctrl_1.addParams({
    "clock": "500MHz",
    "backing": "none",
    "addr_range_start": 0,
})
memory_1 = memctrl_1.setSubComponent("backend", "memHierarchy.simpleMem")
memory_1.addParams({
    "max_requests_per_cycle": 2,
    "mem_size": "1GiB",
    "access_time": "50ns",
})

memctrl_2 = sst.Component("memory2", "memHierarchy.MemController")
memctrl_2.addParams({
    "clock": "500MHz",
    "backing": "none",
    "addr_range_start": 0,
})
memory_2 = memctrl_2.setSubComponent("backend", "memHierarchy.simpleMem")
memory_2.addParams({
    "max_requests_per_cycle": 2,
    "mem_size": "1GiB",
    "access_time": "50ns",
})

# Connect Memory Bus to Memory Controller
mem_bus_link_1 = sst.Link("link_mem_bus_memctrl1_")
mem_bus_link_2 = sst.Link("link_mem_bus_memctrl2_")
mem_bus_link_1.connect((mem_bus, "low_network_0", "50ps"), (memctrl_1, "direct_link", "50ps"))
mem_bus_link_2.connect((mem_bus, "low_network_1", "50ps"), (memctrl_2, "direct_link", "50ps"))



