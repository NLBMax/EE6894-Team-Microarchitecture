import sst
from mhlib import componentlist

# Define the simulation components
cores = 4
caches = 4  # Number of LLCs (L3 caches) on the network
memories = 1
coreclock = "2.4GHz"
uncoreclock = "1.4GHz"
coherence = "MESI"
network_bw = "60GB/s"

DEBUG_L1 = 0
DEBUG_L2 = 0
DEBUG_L3 = 0
DEBUG_L4 = 0
DEBUG_DIR = 0

# Adjust num_ports to account for each core, L3 cache, L4 cache, and memory controller
network_ports = cores + (2 * caches) + memories

# Create the merlin network - a single router
network = sst.Component("network", "merlin.hr_router")
network.addParams({
      "xbar_bw": network_bw,
      "link_bw": network_bw,
      "input_buf_size": "2KiB",
      "num_ports": network_ports,  # Updated port count to include L3 and L4 connections separately
      "flit_size": "36B",
      "output_buf_size": "2KiB",
      "id": "0",  
})
network.setSubComponent("topology", "merlin.singlerouter")

for x in range(cores):
    cpu = sst.Component("core" + str(x), "miranda.BaseCPU")
    cpu.addParams({
        "clock": coreclock,
        "verbose": 0,
    })

    cpugen = cpu.setSubComponent("generator", "miranda.GUPSGenerator")
    cpugen.addParams({
        "iterations": 100,
        "count": 1000,
        "reqLength": 16,
        "memStart": 0,
        "memLength": "512MB",
        "seed_a": 11 + x,
        "seed_b": 31 + x,
    })

    iface = cpu.setSubComponent("memory", "memHierarchy.standardInterface")
    
    l1cache = sst.Component("l1cache" + str(x), "memHierarchy.Cache")
    l1cache.addParams({
        "cache_frequency": coreclock,
        "access_latency_cycles": 2,
        "tag_access_latency_cycles": 1,
        "mshr_latency_cycles": 2,
        "replacement_policy": "lfu",
        "coherence_protocol": coherence,
        "cache_size": "32KiB", 
        "associativity": 8,
        "L1": 1,
        "debug": DEBUG_L1,
        "debug_level": 10,
        "max_outstanding_prefetch": 2, 
    })
    l1cache.setSubComponent("prefetcher", "cassini.NextBlockPrefetcher")

    l2cache = sst.Component("l2cache" + str(x), "memHierarchy.Cache")
    l2cache.addParams({
        "cache_frequency": coreclock,
        "access_latency_cycles": 14,
        "tag_access_latency_cycles": 2,
        "mshr_latency_cycles": 4,
        "replacement_policy": "nmru",
        "coherence_protocol": coherence,
        "cache_size": "64KiB",
        "associativity": 8,
        "max_requests_per_cycle": 1,
        "mshr_num_entries": 8,
        "drop_prefetch_mshr_level": 5,
        "debug": DEBUG_L2,
        "debug_level": 10,
    })
    l2cache.setSubComponent("prefetcher", "cassini.NextBlockPrefetcher")
    l2tl1 = l2cache.setSubComponent("cpulink", "memHierarchy.MemLink")
    l2nic = l2cache.setSubComponent("memlink", "memHierarchy.MemNIC")
    l2nic.addParams({
        "group": 1,
        "network_bw": network_bw,
        "network_input_buffer_size": "2KiB",
        "network_output_buffer_size": "2KiB",
    })

    cpu_l1_link = sst.Link("link_cpu_cache_" + str(x))
    cpu_l1_link.connect((iface, "port", "500ps"), (l1cache, "high_network_0", "500ps"))
    
    l1_l2_link = sst.Link("link_l1_l2_" + str(x))
    l1_l2_link.connect((l1cache, "low_network_0", "100ps"), (l2tl1, "port", "100ps"))

    l2_network_link = sst.Link("link_l2_network_" + str(x))
    l2_network_link.connect((l2nic, "port", "100ps"), (network, "port" + str(x), "100ps"))

# Track network port usage for L3 and L4 connections
l3_port_offset = cores
l4_port_offset = cores + caches

for x in range(caches):
    l3cache = sst.Component("l3cache" + str(x), "memHierarchy.Cache")
    l3cache.addParams({
        "cache_frequency": uncoreclock,
        "access_latency_cycles": 63,
        "tag_access_latency_cycles": 6,
        "mshr_latency_cycles": 12,
        "replacement_policy": "random",
        "coherence_protocol": coherence,
        "cache_size": "16MiB",
        "associativity": 32,
        "mshr_num_entries": 8,
        "num_cache_slices": caches,
        "slice_allocation_policy": "rr",
        "slice_id": x,
        "debug": DEBUG_L3,
        "debug_level": 10,
    })
    l3nic = l3cache.setSubComponent("cpulink", "memHierarchy.MemNIC")
    l3nic.addParams({
        "group": 2,
        "network_bw": network_bw,
        "network_input_buffer_size": "2KiB",
        "network_output_buffer_size": "2KiB",
    })

    # Define address ranges for each L4 cache to prevent overlapping
    l4_addr_range_start = x * (1024 * 1024 * 1024) // caches  # Divide 1GB range by number of caches
    l4_addr_range_end = ((x + 1) * (1024 * 1024 * 1024) // caches) - 1

    # Create L4 Cache connected to each L3
    l4cache = sst.Component("l4cache" + str(x), "memHierarchy.Cache")
    l4cache.addParams({
        "cache_frequency": uncoreclock,
        "access_latency_cycles": 100,
        "tag_access_latency_cycles": 8,
        "mshr_latency_cycles": 20,
        "replacement_policy": "lru",
        "coherence_protocol": coherence,
        "cache_size": "64MiB",
        "associativity": 16,
        "mshr_num_entries": 16,
        "addr_range_start": l4_addr_range_start,  # Set the start of the address range for L4
        "addr_range_end": l4_addr_range_end,      # Set the end of the address range for L4
        "debug": DEBUG_L4,
        "debug_level": 10,
    })
    
    # Add network interface for each L4 cache
    l4nic = l4cache.setSubComponent("cpulink", "memHierarchy.MemNIC")
    l4nic.addParams({
        "group": 3,
        "network_bw": network_bw,
        "network_input_buffer_size": "2KiB",
        "network_output_buffer_size": "2KiB",
    })

    # Direct connection between L3 and L4
    l3_l4_link = sst.Link("link_l3_l4_" + str(x))
    l3_l4_link.connect((l3cache, "low_network_0", "200ps"), (l4cache, "high_network_0", "200ps"))

    # Connect each L4 to the network on a unique port
    l4_network_link = sst.Link("link_l4_network_" + str(x))
    l4_network_link.connect((l4nic, "port", "100ps"), (network, "port" + str(cores + caches + x), "100ps"))

    # Connect L3 to the network on a unique port
    l3_network_link = sst.Link("link_l3_network_" + str(x))
    l3_network_link.connect((l3nic, "port", "100ps"), (network, "port" + str(cores + x), "100ps"))

for x in range(memories):
    directory = sst.Component("directory" + str(x), "memHierarchy.DirectoryController")
    directory.addParams({
        "clock": uncoreclock,
        "coherence_protocol": coherence,
        "entry_cache_size": 65536,
        "mshr_num_entries": 16,
        "interleave_size": "64B",
        "interleave_step": str(memories * 64) + "B",
        "addr_range_start": x * 64,
        "addr_range_end": 1024 * 1024 * 1024 - ((memories - x) * 64) + 63,
        "debug": DEBUG_DIR,
        "debug_level": 10,
    })
    dirtoM = directory.setSubComponent("memlink", "memHierarchy.MemLink")
    dirnic = directory.setSubComponent("cpulink", "memHierarchy.MemNIC")
    dirnic.addParams({
        "group": 4,
        "network_bw": network_bw,
        "network_input_buffer_size": "2KiB",
        "network_output_buffer_size": "2KiB",
    })
    
    memctrl = sst.Component("memory" + str(x), "memHierarchy.MemController")
    memctrl.addParams({
        "clock": "500MHz",
        "backing": "none",
        "interleave_size": "64B",
        "interleave_step": str(memories * 64) + "B",
        "addr_range_start": x * 64,
        "addr_range_end": 1024 * 1024 * 1024 - ((memories - x) * 64) + 63,
    })
    memory = memctrl.setSubComponent("backend", "memHierarchy.simpleDRAM")
    memory.addParams({
        "max_requests_per_cycle": 2,
        "mem_size": "512MiB",
        "tCAS": 2,
        "tRCD": 2,
        "tRP": 3,
        "cycle_time": "3ns",
        "row_size": "4KiB",
        "row_policy": "closed",
    })

    portid = l4_port_offset + caches + x
    link_directory_network = sst.Link("link_directory_network_" + str(x))
    link_directory_network.connect((dirnic, "port", "100ps"), (network, "port" + str(portid), "100ps"))
    
    link_directory_memory_network = sst.Link("link_directory_memory_" + str(x))
    link_directory_memory_network.connect((dirtoM, "port", "400ps"), (memctrl, "direct_link", "400ps"))

# Enable statistics
sst.setStatisticLoadLevel(7)
sst.setStatisticOutput("sst.statOutputConsole")
for a in componentlist:
    sst.enableAllStatisticsForComponentType(a)
