.PHONY: all
all: linux/arch/x86/boot/bzImage

.PHONY: configure
configure:
	[ -f centaurios.config ] && cp centaurios.config linux/.config || $(MAKE) -C linux defconfig
	$(MAKE) -C linux xconfig
	cp linux/.config centaurios.config

.PHONY: clean
clean:
	$(MAKE) -C linux clean mrproper

linux/arch/x86/boot/bzImage: linux/.config .git/modules/linux/HEAD
	$(MAKE) -C linux

linux/.config: centaurios.config
	cp $< $@
