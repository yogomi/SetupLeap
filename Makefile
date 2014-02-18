UNAME = $(shell uname)

LEAP_SDK=LeapDeveloperKit

ifeq ($(UNAME),Linux)
LEAP_LIB=libLeap.so
endif
ifeq ($(UNAME),Darwin)
LEAP_LIB=libLeap.dylib
endif

all: $(LEAP_SDK) $(FIND_LEAP)
	rm -rf dist
	mkdir -p dist/usr/local/include
	mkdir -p dist/usr/local/lib
	cp $(LEAP_SDK)/LeapSDK/include/Leap.h dist/usr/local/include/
	cp $(LEAP_SDK)/LeapSDK/include/LeapMath.h dist/usr/local/include/
	cp $(LEAP_SDK)/LeapSDK/lib/$(LEAP_LIB) dist/usr/local/lib/

install: all
	cp dist/usr/local/include/* /usr/local/include/
	cp dist/usr/local/lib/* /usr/local/lib/


PHONY: all install clean
