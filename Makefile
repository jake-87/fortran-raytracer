SRCDIR = src
TARGET = fray
build-topdir:
	cd $(SRCDIR) && make && cp $(TARGET) ../
