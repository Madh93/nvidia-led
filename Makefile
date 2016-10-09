BINNAME=nvidia-led
BINARYDIR=/usr/bin
CONFIGDIR=~/.config/nvidia-led

.PHONY: directories

all: directories

directories:
	mkdir -p $(CONFIGDIR)
	cp -rf styles $(CONFIGDIR)

install:
	cp nvidia-led.sh $(BINARYDIR)/$(BINNAME)
	chmod -R 755 $(BINARYDIR)/$(BINNAME)

uninstall:
	rm -f $(BINARYDIR)/nvidia-led
	rm -rf $(CONFIGDIR)
