#
# Rechnernutzung in der Physik, WS 2011/12, Blatt 04, Aufg. 9
# 
# Zur Verfuegung gestelltes Makefile 
#
#----------------------------------------------------------------------------
#
# Variablendefinitionen:
#
# Compile settings

CXX      := g++
CXXFLAGS := -O3 -std=c++11 -fPIC

SHCXXFLAGS	:= -fPIC -shared -std=c++11 -DBOOST_IT
SHLDLIBS	:= -lpython2.7 -lboost_python


# Link settings
LD       := g++                # Use g++ for linking
LDFLAGS  := -O
LDLIBS   := -lpthread -lm -ldl -lpython2.7 -lboost_python
#-lGui -lCore -lRIO -lNet -lHist -lGraf -lGraf3d -lGpad -lTree -lRint -lPostscript -lMatrix -lPhysics -lMathCore -lThread

#LIB	:= -L/$(ROOTSYS)/lib/

#INC	:=-I/$(ROOTSYS)/include/ -I/usr/include/python2.6
INC	:= -I/usr/include/python2.6



sources  := measurement.cc electron.cc Bcalc.c
objects  := $(sources:.cc=.o)  # Objektdateien sind die


shsources	:= electron.cc Bcalc.c
shobjects	:= $(shsources:.cc=.o)  # Objektdateien sind die

#----------------------------------------------------------------------------


findMomentum: $(objects)
	$(LD) $(LDFLAGS) -o findMomentum $(objects) findMomentum.cc $(CXXFLAGS) $(LIB) $(INC) $(LDLIBS) && rm *.o

getDeflection: $(objects)
	$(LD) $(LDFLAGS) -o getDeflection $(objects) getDeflection.cc $(CXXFLAGS) $(LIB) $(INC) $(LDLIBS) && rm *.o


cc: $(objects)
	$(LD) $(LDFLAGS) -o findMomentum $(objects) findMomentum.cc $(CXXFLAGS) $(LIB) $(INC) $(LDLIBS)
	$(LD) $(LDFLAGS) -o getDeflection $(objects) getDeflection.cc $(CXXFLAGS) $(LIB) $(INC) $(LDLIBS) && rm *.o

shared: $(shobjects)
	$(LD) $(LDFLAGS) -o measurement.so $(shobjects) measurement.cc $(SHCXXFLAGS) $(LIB) $(INC) $(SHLDLIBS)  && rm *.o

