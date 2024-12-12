# EE6894-Team-Microarchitecture
This is a project that builds the Cloak design on SST.

# **Building Rev (RISC CPU) in SST**
The Rev SST component is designed to provide cycle-based simulation capabilities of an arbitrary RISC-V core or cores. Rev utilizes the Sandia Structural Simulation Toolkit as the core parallel discrete event simulation framework. More detailed design and description can be found in the following GitHub repository: [Rev](https://github.com/tactcomplabs/rev).

This document describes how to install Rev on Linux. For more detailed instructions, refer to the GitHub repository linked above.

## **1. Building RISC Compiler**
As mentioned above, the Rev SST model supports standard ELF binary payloads as input to the model. As a result, we need a cross-compilation framework to build source code into suitable binaries. We recommend using [riscv-gnu-toolchain](https://github.com/riscv/riscv-gnu-toolchain) as the compiler.

### **Installing riscv-gnu-toolchain**
Several standard packages are needed to build the toolchain.
```bash
$ sudo apt-get install autoconf automake autotools-dev curl python3 python3-pip libmpc-dev libmpfr-dev libgmp-dev gawk build-essential bison flex texinfo gperf libtool patchutils bc zlib1g-dev libexpat-dev ninja-build git cmake libglib2.0-dev libslirp-dev
```

Here is a brief description of how to install the RISC-V GNU toolchain. For more details, refer to the GitHub repository above.
```bash
git clone https://github.com/riscv/riscv-gnu-toolchain
cd riscv-gnu-toolchain
git submodule update --init --recursive
./configure --prefix=/opt/riscv --enable-multilib
make linux
```

## **2. Building RISC CPU**
Building the Rev SST component from source using CMake (>= 3.19) can be performed as follows:

### **Steps**
1. If you are using the compiler above, you can find the compiler in `/opt/riscv`.
2. Clone the repository and build:
   ```bash
   git clone https://github.com/tactcomplabs/rev.git
   cd rev/build
   export RISCV=/opt/riscv
   cmake -DRVCC=$RISCV/bin/riscv64-unknown-elf-gcc ..
   ```
3. **Important Note:**  
   For the current version (as of 12/1/2024), if you are using SST version 14.0.0 or above, you need to make the following changes in the `src/RevNIC.cc` file:  
   - Replace `sendInitData` with `sendUntimedData`.
   - Replace `recvInitData` with `recvUntimedData`.

4. Build and install:
   ```bash
   make
   make install
   
