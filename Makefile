# If KERNELRELEASE is defined, we're in the kernel build system.
ifneq ($(KERNELRELEASE),)
    # Kernel module build rules
    obj-m := simple.o

# Otherwise, we're being called from the command line.
else
    # Kernel module variables
    KERNELDIR ?= /lib/modules/$(shell uname -r)/build
    PWD := $(shell pwd)

    # User-space application variables
    CC := g++
    APP_SRC := RM-AP.c
    APP_BIN := RM-AP

default:
	# Compile the kernel module
	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules
	# Compile the user-space application
	$(MAKE) $(APP_BIN)

# Rule to compile user-space application
$(APP_BIN): $(APP_SRC)
	$(CC) -o $@ $<

clean:
	# Clean kernel module build files
	$(MAKE) -C $(KERNELDIR) M=$(PWD) clean
	# Clean user-space application binary
	rm -f $(APP_BIN)

endif

