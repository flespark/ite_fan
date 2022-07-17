KDIR ?= /lib/modules/$(shell uname -r)/build
obj-m += it87.o
it87-objs += it87_fan.o hwmon-vid.o

build:
	$(MAKE) -C  $(KDIR) M=$(PWD) modules

clean:
	$(MAKE) -C  $(KDIR) M=$(PWD) clean

install: build
	if lsmod | grep it87; then modprobe -r it87; fi
	insmod it87.ko
	# install -v -m700 $(PWD)/it87.ko /lib/modules/$(shell uname -r)/kernel/drivers/hwmon/
	# depmod -a
	# modprobe it87

all: build
