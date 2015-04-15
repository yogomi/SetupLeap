UNAME = $(shell uname)

FIND_LEAP=Find-Leap/FindLeap.cmake

ifeq ($(UNAME),Linux)
LEAP_LIB=libLeap.so
endif
ifeq ($(UNAME),Darwin)
LEAP_LIB=libLeap.dylib
endif

all: $(FIND_LEAP)
	echo $(LEAP_SDK)
	rm -rf dist
	mkdir -p dist/usr/local/include
	mkdir -p dist/usr/local/lib
	cp $(LEAP_SDK)/LeapSDK/include/Leap.h dist/usr/local/include/
	cp $(LEAP_SDK)/LeapSDK/include/LeapMath.h dist/usr/local/include/
	cp $(LEAP_SDK)/LeapSDK/lib/$(LEAP_LIB) dist/usr/local/lib/

$(FIND_LEAP):
	git clone https://github.com/tomcarter259/Find-Leap.git

install: all
	cp $(FIND_LEAP) /usr/local/Cellar/cmake/3.2.1/share/cmake/Modules/
	cp dist/usr/local/include/* /usr/local/include/
	cp dist/usr/local/lib/* /usr/local/lib/


PHONY: all install clean
