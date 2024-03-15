# mk70fn1m0_cmake_example
This is an example CMake layout for a project using the NXP MK70FN1M0 microcontroller and CMake build system. The project assumes you have basic knowledge of CMake and ARM toolchain setup.

## Getting Started
These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites
What things you need to install the software and how to install them:
- CMake - Install with your distribution's package manager for Linux or `brew install cmake` (for MacOS)
- ARM GNU toolchain - Install with your distribution's package manager or `brew install arm-none-eabi-gcc` (for MacOS)
- Embedded Warrior Library (EWL) - Found at `C:\Freescale\CW MCU v11.1\MCU\ARM_GCC_Support\ewl` on a default Window's installation of CodeWarrior. Copy the folder `ewl` to somewhere on your machine and set its absolute directory path to the environment variable `EWL_LIB_PATH`
- To remain compatible with CodeWarrior you need the spec files they use, `ewl_c_hosted.specs` and `ewl_c_noio.specs`. This tells the linker which static libraries to include. Copy those files (they're in the root of this repo) into `/usr/arm-none-eabi/lib` (not sure what it is on Mac but it should be in the parent path of the result of `whereis readelf` after you've installed the GNU ARM toolchain)

### Installation
A step by step guide on how to get a development environment running:
1. Clone the repository: `git clone https://github.com/Ktrod/mk70fn1m0_cmake_example`
2. Copy the CMake files into the root of your project and copy any relevant files into the matching folders
3. Navigate into the project directory: `cd MyOS`
4. Create a build folder: `mkdir build && cd build`
5. Configure CMake with the ARM GNU toolchain: `cmake --fresh .. && cmake ..`
6. Build the project: `make`
7. Deploy the generated ELF on target device

## Deployment

Generally it's easiest to deploy with Segger's JLinkCommander/Ozone if you have a J-Link. Otherwise you 
can use OpenOCD and GDB.


## Notes

If building without I/O under remove `-D__SEMIHOSTING` and change the spec from `ewl_c_hosted.specs` to `ewl_c_noio.specs` on `OBJECT_GEN_FLAGS` in `mk70fn1m0.cmake`. 
