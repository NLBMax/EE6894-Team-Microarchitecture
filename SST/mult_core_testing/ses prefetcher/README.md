# README: Configuring the SST Element with Smoothing Prefetch

This README provides step-by-step instructions for configuring and verifying the addition of smoothing prefetch files to the SST element.

## Prerequisites
Before proceeding, ensure you have the following:
- SST core installed.
- Required development tools (e.g., `gcc`, `make`, etc.).

## Steps to Configure

1. **Modify the `Makefile.am` File**:
   - Open the file `Makefile.am` in a text editor.
   - Locate the line starting with `libcassini_la_SOURCES =`.
   - Add the following entries to the list:
     ```
     smoothingprefetch.cc \
     smoothingprefetch.h \
     ```
   Ensure there is a backslash (`\`) at the end of each line except the last.

2. **Run the Configuration Command**:
   Execute the following command to configure the SST element:
   ```
   ./configure --prefix=<install_path> --with-sst-core=<install_path>
   ```
   Replace `<install_path>` with the appropriate installation path.

3. **Verify `Makefile` Configuration**:
   - Open the generated `Makefile` and locate the line starting with `libcassini_la_SOURCES =`.
   - Ensure it includes the following files:
     ```
     smoothingprefetch.cc \
     smoothingprefetch.h \
     ```
   Ensure there is a backslash (`\`) at the end of each line except the last.
   If these entries are missing, repeat the modification step in `Makefile.am` and re-run the `./configure` command.

4. **Build the SST Element**:
   If the `Makefile` is correctly updated, proceed with building the SST element:
   ```
   make
   make install
   ```

## Troubleshooting
- If the configuration or build process fails, ensure that all dependencies are installed and that the file paths specified in the commands are correct.
- Verify that `Makefile.am` was updated correctly and that the configuration command was executed in the proper directory.
