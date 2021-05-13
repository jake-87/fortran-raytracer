SRCDIR = src
TARGET = fray
build-topdir:
	cd $(SRCDIR) && make && cp $(TARGET) ../
run: 
	make clean
	make build-topdir
	./$(TARGET)
gc:
	git add .
	git commit
	git push
clean:
	rm -f $(TARGET) *.mod
	cd src && make clean
