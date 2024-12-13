# EE6894-Team-Microarchitecture
This is a project that builds the Cloak design on SST.

# Installing Structural Simulation Toolkit (SST) 14.1.x

This guide provides instructions for installing the Structural Simulation Toolkit (SST) version 14.1.x. It assumes you are familiar with Unix/Linux/OSX environments. For detailed information, refer to the [SST Build and Install Guide](https://sst-simulator.org/SSTPages/SSTBuildAndInstall_14dot1dot0_SeriesQuickStart/).

## Prerequisites

Before installing SST, ensure the following external components are installed on your system:
- **OpenMPI**: Recommended for parallel simulations.
The installation of **OpenMPI** can be found in following website: [install OpenMPI](https://sst-simulator.org/SSTPages/SSTBuildAndInstall_14dot1dot0_SeriesDetailedBuildInstructions/#openmpi-414-strongly-recommended).

These dependencies may be available through your operating system's package manager. Ensure that the installed versions are compatible with SST 14.1.x, as specified in the [Release Notes](https://sst-simulator.org/sstannouncements/2024/10/17/SST-v14.1.0-Released/).

## Installation Steps

### 1. Download SST-Core and SST-Elements
- Obtain the SST-Core 14.1.x and SST-Elements 14.1.x tarballs from the [SST Downloads Page](https://sst-simulator.org/SSTPages/SSTMainDownloads/).

### 2. Extract the Tarballs
- Create separate directories for SST-Core and SST-Elements, then extract the tarballs:
  ```bash
  mkdir -p $HOME/mysst/sst-core
  mkdir -p $HOME/mysst/sst-elements
  tar -xzf sstcore-14.1.x.tar.gz -C $HOME/mysst/sst-core --strip-components=1
  tar -xzf sstelements-14.1.x.tar.gz -C $HOME/mysst/sst-elements --strip-components=1
  ```

### 3. Build and Install SST-Core
- Navigate to the SST-Core directory:
  ```bash
  cd $HOME/mysst/sst-core
  ```
- Configure the build (replace `<install_path>` with your desired installation directory):
  ```bash
  ./configure --prefix=<install_path>
  ```
- Compile and install:
  ```bash
  make
  make install
  ```

### 4. Build and Install SST-Elements
- Navigate to the SST-Elements directory:
  ```bash
  cd $HOME/mysst/sst-elements
  ```
- Configure the build, linking it to the SST-Core installation:
  ```bash
  ./configure --prefix=<install_path> --with-sst-core=<install_path>
  ```
- Compile and install:
  ```bash
  make
  make install
  ```

### 5. Verify the Installation
- Ensure the `sst` executable is in your PATH, then check the version:
  ```bash
  export PATH=<install_path>/bin:$PATH
  sst --version
  ```

---

Feel free to consult the [official guide](https://sst-simulator.org/SSTPages/SSTBuildAndInstall_14dot1dot0_SeriesQuickStart/) for troubleshooting or further customization.

   
