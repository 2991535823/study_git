cmake_minimum_required(VERSION 3.5)



project(hellodemo)
set(work_dir /home/bera/software_pack/T113-i_v1.0)
set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR arm)
set(tools ${work_dir}/out/t113_i/tlt113-minievm-emmc/longan/buildroot/host/bin)
set(CMAKE_C_COMPILER ${tools}/arm-linux-gnueabi-gcc)
set(CMAKE_CXX_COMPILER ${tools}/arm-linux-gnueabi-g++)

include_directories( ${work_dir}/kernel/linux-5.4/include/)
include_directories( ${work_dir}/kernel/linux-5.4/arch/arm64/include/)
include_directories( ${work_dir}/kernel/linux-5.4/arch/arm/include/)

include_directories(/home/bera/software_pack/T113-i_v1.0/out/t113_i/tlt113-minievm-emmc/longan/buildroot/build/uboot-tools-2018.07/arch/arm/include)

add_executable(${PROJECT_NAME} hello.c)
