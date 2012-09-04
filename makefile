CXX = nvcc
LD  = $(CXX)

LIBS_PATH = -L/usr/lib
LIBS = -lmpi -lopa -lmpl -lrt -lcr -lpthread
INCLUDE_PATH = -I/usr/lib/mpich2/include
FLAGS = -g
TARGET = "src/main.cpp"
OBIN = "bin/cuda&mpi"

all: $(TARGET)

$(TARGET):
	$(LD) $(INCLUDE_PATH) $(FLAGS) $(TARGET) -o $(OBIN) $(LIBS_PATH) $(LIBS)
