# README: Configuring and Using Different Prefetchers

This README provides instructions for configuring and using different prefetchers in the SST framework. Four prefetcher options are available, each differing in benchmarks. Follow the steps below to switch between prefetchers and configure them as needed.

## Available Prefetchers
1. **SES Prefetcher** (Custom):
   - Created by this project.
   - Requires additional configuration.
   - Configuration details can be found in the `ses prefetcher` prefetcher folder in this directory.
2. **Stride Prefetcher** (Built-in):
   - Part of SST elements.
   - No additional configuration required.
3. **Pala Prefetcher** (Built-in):
   - Part of SST elements.
   - No additional configuration required.
4. **NextBlock Prefetcher** (Built-in):
   - Part of SST elements.
   - No additional configuration required.

## Steps to Switch Prefetchers

1. **Locate the Prefetcher Configuration Line**:
   Open the relevant source file and find the line:
   ```
   l3cache.setSubComponent("prefetcher", "cassini.SESPrefetcher")
   ```

2. **Modify the Prefetcher Type**:
   - Replace `SESPrefetcher` with the desired prefetcher option:
     - `StridePrefetcher`
     - `PalaPrefetcher`
     - `NextBlockPrefetcher`
   - Example:
     ```
     l3cache.setSubComponent("prefetcher", "cassini.StridePrefetcher")
     ```

3. **Build the Project**:
   - Since `StridePrefetcher`, `PalaPrefetcher`, and `NextBlockPrefetcher` are built-in prefetchers, no additional setup is needed.
   - For `SESPrefetcher`, ensure it is properly configured (see the section below).

4. **Compile and Run**:
   - Use your standard build process to compile and run the project.
   - Verify the benchmark results to ensure the desired prefetcher is in use.

5. **To Compile and Run the Project**:
   Use the command:
   ```
   sst multi_core_*.py
   ```
   Here, `*` indicates different benchmarks (e.g., `GUPS`, `SPMV`, `Stencil3D`, `STREAM`).
   
   It is recommended to add arguments like:
   ```
   > gups_sesprefetch.log
   ```
   after the commands to redirect output to a log file. 

   With the helper function `filter_cachehitmiss.py`, you can quickly filter out all `*.log` files to extract cache hits/misses and simulated time. `filtered_output.txt` is the sample output for all 4x4 combinations of benchmarks and prefetchers.

## Configuring SES Prefetcher
The `SES Prefetcher` is a custom prefetcher created by this project and requires additional setup:
1. Navigate to the `ses` prefetcher folder in this directory.
2. Follow the instructions provided in that folder to configure the SES prefetcher.
3. Ensure that all necessary dependencies and settings are correctly applied before compiling.
