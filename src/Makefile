SRC != ls *.f90
OBJ != ls *.o
TARGET = fray
build:
	gfortran $(SRC) -c
	make obj
	make cleanobj
obj:
	gfortran $(OBJ) -o $(TARGET)
cleanobj:
	rm -f $(OBJ)
clean:
	make cleanobj
	rm -f $(TARGET)
cleanmod:
	rm -f *.mod
