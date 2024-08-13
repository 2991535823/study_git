KERNEL_DIR=/home/bera/software_pack/T113-i_v1.0/kernel/linux-5.4
ARCH=arm
CROSS_COMPILE=arm-linux-gnueabi-
PATH=$PATH:/home/bera/software_pack/T113-i_v1.0/out/t113_i/tlt113-minievm-emmc/longan/buildroot/host/bin
export  ARCH  CROSS_COMPILE PATH

obj-m := hello.o
all:
	$(CROSS_COMPILE)gcc -o hellotest hellotest.c 
    $(MAKE) -C $(KERNEL_DIR) M=$(CURDIR) modules

.PHONE:clean

clean:
   $(MAKE) -C $(KERNEL_DIR) M=$(CURDIR) clean
