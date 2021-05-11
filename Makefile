FORTRANFLAGS= -O2
LIBFILES != ls lib/*
SRC != ls src/*
MOD != ls *.mod
TARGET="raytracer"
OFILES != ls *.o
LIBs = libraytracer.so
default:
	make build
libfiles:
	gfortran $(FORTRANFLAGS) -c -fPIC $(LIBFILES)
	$(eval OFILES != ls *.o)
	make compilelib
clean:
	rm -f $(MOD) $(OFILES)
build:
	make clean
	make libfiles
	gfortran -R./ $(LIBs) $(SRC) -o $(TARGET)
help:
	@echo "Options:"
	@echo "build : build executable from src found in ./src/"
	@echo "libfiles : build .so file"
	@echo "clean : remove executable and mod files, but not .so file"
	@echo "cleanlib : remove .so file"
	@echo "help : how you got here ;)"
compilelib:
	gfortran -fPIC -shared -o $(LIBs) $(OFILES)
