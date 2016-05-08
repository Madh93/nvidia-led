BINNAME=nvidia-led
BINARYDIR=/usr/bin
CONFIGDIR=~/.config/nvidia-led

install:
	cp nvidia-led.sh $(BINARYDIR)/$(BINNAME)
	mkdir -p $(CONFIGDIR)
	cp -rf styles $(CONFIGDIR)
	chmod -R 755 $(CONFIGDIR) $(BINARYDIR)/$(BINNAME)
	chown -R 1000:1000 $(CONFIGDIR)

uninstall:
	rm -f $(BINARYDIR)/nvidia-led
	rm -rf $(CONFIGDIR)