import sst
from mhlib import componentlist

# Define the simulation components
# cores with private L1/L2
# Shared distributed LLCs
# All caches have prefetchers and limit prefetching


cores = 4
caches = 4  # Number of LLCs on the network
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

l2_start_port = 0
l3_start_port = cores
l4_start_port = cores + caches
dir_start_port = cores + caches * 2

# Create merlin network - this is just simple single router
network = sst.Component("network", "merlin.hr_router")
network.addParams({
      "xbar_bw" : network_bw,
      "link_bw" : network_bw,
      "input_buf_size" : "2KiB",
      "num_ports" : cores + caches*2 + memories,
      "flit_size" : "36B",
      "output_buf_size" : "2KiB",
      "id" : "0",  
})
network.setSubComponent("topology","merlin.singlerouter")

for x in range(cores):
    cpu = sst.Component("core" + str(x), "miranda.BaseCPU")
    cpu.addParams({
        "clock" : coreclock,
        "verbose" : 0,
    })


    # cpugen = cpu.setSubComponent("generator", "miranda.GUPSGenerator")
    # cpugen.addParams({
    #         "iterations" : 100,
    #         "count" : 1000,
    #         "reqLength" : 16,
    #         "memStart" : 0,
    #         "memLength" : "512MB",
    #         "seed_a" : 11,
    #         "seed_b" : 31,
    # })
    gen = cpu.setSubComponent("generator", "miranda.STREAMBenchGenerator")
    gen.addParams({
    	"verbose" : 0,
    	"n" : 10000,
            "operandwidth" : 16,
    })
    # gen = cpu.setSubComponent("generator", "miranda.SPMVGenerator")
    # gen.addParams({
    #     "matrix_nx" : 3000,
    #     "matrix_ny" : 3000,
    #     "element_width" : 8,
    #     "lhs_start_addr" : 0,
    #     "rhs_start_addr" : 3000,
    #     "local_row_start" : 0,
    #     "local_row_end" : 10000,
    #     "ordinal_width" : 8,
    #     "matrix_row_indices_start_addr" : 0,
    #     "matrix_col_indices_start_addr" : 0,
    #     "matrix_element_start_addr" : 0,
    #     "iterations" : 1,
    #     "matrix_nnz_per_row" : 9
    # })
    # gen = cpu.setSubComponent("generator", "miranda.Stencil3DBenchGenerator")
    # gen.addParams({
    #     "verbose" : 0,
    #     "nx" : 20,
    #     "ny" : 20,
    #     "nz" : 20,
    #     "datawidth" : 8,
    #     "startz" : 0,
    #     "endz" : 20,
    #     "iterations" : 1,
    # })
    # gen = cpu.setSubComponent("generator", "miranda.Stake")
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

    iface = cpu.setSubComponent("memory", "memHierarchy.standardInterface")
    
    l1cache = sst.Component("l1cache" + str(x), "memHierarchy.Cache")
    l1cache.addParams({
        "cache_frequency" : coreclock,
        "access_latency_cycles" : 2,
        "tag_access_latency_cycles" : 1,
        "mshr_latency_cycles" : 2,
        "replacement_policy" : "lfu",
        "coherence_protocol" : coherence,
        "cache_size" : "32KiB", 
        "associativity" : 8,
        "L1" : 1,
        "debug" : DEBUG_L1,
        #"debug_addr" : "[1152]",
        "debug_level" : 10,
        "max_outstanding_prefetch" : 2, 
    })
    l1cache.setSubComponent("prefetcher", "cassini.StridePrefetcher")

    l2cache = sst.Component("l2cache" + str(x), "memHierarchy.Cache")
    l2cache.addParams({
        "cache_frequency" : coreclock,
        "access_latency_cycles" : 14,
        "tag_access_latency_cycles" : 2,
        "mshr_latency_cycles" : 4,
        "replacement_policy" : "lfu",
        "coherence_protocol" : coherence,
        "cache_size" : "64KiB",
        "associativity" : 8,
        "max_requests_per_cycle" : 1,
        "mshr_num_entries" : 8,
        "drop_prefetch_mshr_level" : 5, # Drop prefetch when total misses > 5
        "debug" : DEBUG_L2,
        #"debug_addr" : "[1152]",
        "debug_level" : 10,
    })
    l2cache.setSubComponent("prefetcher", "cassini.StridePrefetcher")
    l2tl1 = l2cache.setSubComponent("cpulink", "memHierarchy.MemLink")
    l2nic = l2cache.setSubComponent("memlink", "memHierarchy.MemNIC")
    l2nic.addParams({
        "group" : 1,
        "network_bw" : network_bw,
        "network_input_buffer_size" : "2KiB",
        "network_output_buffer_size" : "2KiB",
    })

    cpu_l1_link = sst.Link("link_cpu_cache_" + str(x))
    cpu_l1_link.connect ( (iface, "port", "500ps"), (l1cache, "high_network_0", "500ps") )
    
    l1_l2_link = sst.Link("link_l1_l2_" + str(x))
    l1_l2_link.connect( (l1cache, "low_network_0", "100ps"), (l2tl1, "port", "100ps") )

    l2_network_link = sst.Link("link_l2_network_" + str(x))
    l2_network_link.connect( (l2nic, "port", "100ps"), (network, "port" + str(l2_start_port + x), "100ps") )

for x in range(caches):
    l3cache = sst.Component("l3cache" + str(x), "memHierarchy.Cache")
    l3cache.addParams({
        "cache_frequency": uncoreclock,
        "access_latency_cycles": 63,
        "tag_access_latency_cycles": 6,
        "mshr_latency_cycles": 12,
        "replacement_policy": "lfu",
        "coherence_protocol": coherence,
        "cache_size": "200KiB",
        "associativity": 16,
        "mshr_num_entries": 8,
        "num_cache_slices": caches,
        "slice_allocation_policy": "rr",
        "slice_id": x,
        "debug": DEBUG_L3,
        "debug_level": 10,
    })
    l3cache.setSubComponent("prefetcher", "cassini.StridePrefetcher")

    # Configure MemNIC for L3
    l3_mem_nic = l3cache.setSubComponent("memlink", "memHierarchy.MemNIC")
    l3_mem_nic.addParams({
        "group": 2,
        "network_bw": network_bw,
        "network_input_buffer_size": "2KiB",
        "network_output_buffer_size": "2KiB",
    })

    # Connect L3 to network
    l3_network_port = l3_start_port + x  # Assign ports after L2
    l3_network_link = sst.Link("link_l3_network_" + str(x))
    l3_network_link.connect((l3_mem_nic, "port", "100ps"), (network, "port" + str(l3_network_port), "100ps"))


for x in range(caches):
    l4cache = sst.Component("l4cache" + str(x), "memHierarchy.Cache")
    l4cache.addParams({
        "cache_frequency": uncoreclock,
        "access_latency_cycles": 63,
        "tag_access_latency_cycles": 6,
        "mshr_latency_cycles": 12,
        "replacement_policy": "lfu",
        "coherence_protocol": coherence,
        "cache_size": "16MiB",
        "associativity": 16,
        "mshr_num_entries": 8,
        "num_cache_slices": caches,
        "slice_allocation_policy": "rr",
        "slice_id": x,
        "debug": DEBUG_L4,
        "debug_level": 10,
    })
    l4cache.setSubComponent("prefetcher", "cassini.StridePrefetcher")

    # Configure MemNIC for L4
    l4_mem_nic = l4cache.setSubComponent("memlink", "memHierarchy.MemNIC")
    l4_mem_nic.addParams({
        "group": 3,
        "network_bw": network_bw,
        "network_input_buffer_size": "2KiB",
        "network_output_buffer_size": "2KiB",
    })
    # Connect L4 to network
    l4_network_port = l4_start_port + x  # Assign ports after L3
    l4_network_link = sst.Link("link_l4_network_" + str(x))
    l4_network_link.connect((l4_mem_nic, "port", "100ps"), (network, "port" + str(l4_network_port), "100ps"))


for x in range(memories):
    directory = sst.Component("directory" + str(x), "memHierarchy.DirectoryController")
    directory.addParams({
        "clock" : uncoreclock,
        "coherence_protocol" : coherence,
        "entry_cache_size" : 65536,
        "mshr_num_entries" : 16,
        "interleave_size" : "64B",    # Interleave at line granularity between memories
        "interleave_step" : str(memories * 64) + "B",
        "addr_range_start" : x*64,
        "addr_range_end" :  1024*1024*1024 - ((memories - x) * 64) + 63,
        "debug" : DEBUG_DIR,
        #"debug_addr" : "[1152]",
        "debug_level" : 10,
    })
    dirtoM = directory.setSubComponent("memlink", "memHierarchy.MemLink")
    dirnic = directory.setSubComponent("cpulink", "memHierarchy.MemNIC")
    dirnic.addParams({
        "group" : 4,
        "network_bw" : network_bw,
        "network_input_buffer_size" : "2KiB",
        "network_output_buffer_size" : "2KiB",
    })
    
    memctrl = sst.Component("memory" + str(x), "memHierarchy.MemController")
    memctrl.addParams({
        "clock" : "500MHz",
        "backing" : "none",
        "interleave_size" : "64B",    # Interleave at line granularity between memories
        "interleave_step" : str(memories * 64) + "B",
        "addr_range_start" : x*64,
        "addr_range_end" :  1024*1024*1024 - ((memories - x) * 64) + 63,
    })
    memory = memctrl.setSubComponent("backend", "memHierarchy.simpleDRAM")
    memory.addParams({
        "max_requests_per_cycle" : 2,
        "mem_size" : "512MiB",
        "tCAS" : 2,
        "tRCD" : 2,
        "tRP" : 3,
        "cycle_time" : "3ns",
        "row_size" : "4KiB",
        "row_policy" : "closed",
    })

    portid = dir_start_port + x
    link_directory_network = sst.Link("link_directory_network_" + str(x))
    link_directory_network.connect( (dirnic, "port", "100ps"), (network, "port" + str(portid), "100ps") )
    
    link_directory_memory_network = sst.Link("link_directory_memory_" + str(x))
    link_directory_memory_network.connect( (dirtoM, "port", "400ps"), (memctrl, "direct_link", "400ps") )

# Enable statistics
sst.setStatisticLoadLevel(11)
sst.setStatisticOutput("sst.statOutputConsole")
for a in componentlist:
    sst.enableAllStatisticsForComponentType(a)
