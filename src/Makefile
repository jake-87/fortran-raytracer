SRC != ls *.f90
OBJ != ls *.o
MOD != ls *.mod
TARGET = fray
build:
	gfortran $(SRC) -c
	make obj
	make cleanobj
obj:
	gfortran $(OBJ) -o $(TARGET)
cleanobj:
	rm $(OBJ)
	rm $(MOD)
