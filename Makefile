#第六个makefile(函数的使用)


Cxx = g++
LD  := ld

LDFLAGS := -shared -fpic
CPPFLAGS = -O2 -g 
CxxFLAGS = -lpthread -lrt


INCLUDE = -I./
INCLUDE += -I./base

OBJ_OUT=obj

SRCDIR0 := ./
SRCDIR1 := ./base
SRC_FILES := $(wildcard $(SRCDIR0)/*.cpp $(SRCDIR1)/*.cpp)

SRC_FILES_NOMAIN := $(subst .//main.cpp, ,$(SRC_FILES))

OBJ = $(patsubst %.cpp, %.o, $(SRC_FILES))
OBJ_FILES = $(OBJ:%.o=$(OBJ_OUT)/%.o)

OBJ_FILES_NOMAIN = $(subst obj/.//main.o, ,$(OBJ_FILES))

TRG := run
TARGET_LIB :=libtestmy.so



.PHONY:all


all: MKAE_DIR $(TRG) 

MKAE_DIR:
	@-mkdir -p $(OBJ_OUT)
	@-mkdir -p $(OBJ_OUT)/$(SRCDIR0)
	@-mkdir -p $(OBJ_OUT)/$(SRCDIR1)
	
$(TRG):$(OBJ_FILES)
	$(Cxx)  $(CPPFLAGS) $^ -o $@ $(INCLUDE) $(CxxFLAGS)
	
$(OBJ_OUT)/%.o:%.cpp
	$(Cxx) $(CPPFLAGS) -c $< -o $@ $(INCLUDE) 
cso:
	
	$(CXX) $(LDFLAGS) $(CxxFLAGS) $(CPPFLAGS)  -o $(TARGET_LIB) $(SRC_FILES_NOMAIN) $(INCLUDE) 

clean:
	-rm -rf $(OBJ_OUT)
	-rm -rf $(TARGET_LIB)
	-rm -rf $(TRG)
	-rm -rf $(OBJ_FILES)