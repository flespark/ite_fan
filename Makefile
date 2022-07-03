KERNEL_RELEASE ?= /lib/modules/$(shell uname -r)/build

obj-m += it87.o

all:
	$(MAKE) -C  $(KERNEL_RELEASE) M=$(PWD) modules

clean:
	$(MAKE) -C  $(KERNEL_RELEASE) M=$(PWD) clean
