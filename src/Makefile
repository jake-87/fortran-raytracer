SRC != ls *.f90
OBJ != ls *.o
TARGET = fray
build:
	gfortran $(SRC) -c -fopenmp
	make obj
	make cleanobj
obj:
	gfortran $(OBJ) -o $(TARGET) -fopenmp
cleanobj:
	rm -f $(OBJ)
clean:
	make cleanobj
	rm -f $(TARGET)
cleanmod:
	rm -f *.mod
