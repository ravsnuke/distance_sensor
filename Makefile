IOT_HOME = /home/ravi/Desktop/EOSI/Fall_2018/Assignments/iot-devkit/1.7.2/sysroots
KERNEL = $(IOT_HOME)/i586-poky-linux/usr/src/kernel_header/kernel
PATH := $(PATH):$(IOT_HOME)/x86_64-pokysdk-linux/usr/bin/i586-poky-linux

APP = hashtester

obj-m += Hash_Driver.o

all:
	make ARCH=x86 CROSS_COMPILE=i586-poky-linux- -C $(KERNEL) M=$(PWD) modules
	i586-poky-linux-gcc -pthread -o $(APP) Main.c 
	rm -f *.o
	rm -f Module.symvers
	rm -f modules.order
	rm -f *.mod.c
	rm -f *.mod.o

#Removes all the files generated by make all
clean:
	make ARCH=x86 CROSS_COMPILE=i586-poky-linux- -C $(KERNEL) M=$(PWD) clean
	rm -f $(APP)
