XBUILD=/Applications/Xcode.app/Contents/Developer/usr/bin/xcodebuild
PROJECT_ROOT=.
PROJECT=$(PROJECT_ROOT)/icu-lib-osx.xcodeproj
TARGET=icu-lib-osx
LIB=icu4c
PLATFORM_LIBS=lib$(LIB)-i386.a lib$(LIB)-x86_64.a

all: lib$(LIB)-osx-universal.a

lib$(LIB)-i386.a:
	$(XBUILD) -project $(PROJECT) -target $(TARGET)	-sdk macosx10.11 -arch i386 -configuration Release clean build
	mv $(PROJECT_ROOT)/build/Release/lib$(LIB).a $@

lib$(LIB)-x86_64.a:
	$(XBUILD) -project $(PROJECT) -target $(TARGET)	-sdk macosx10.11 -arch x86_64 -configuration Release clean build
	mv $(PROJECT_ROOT)/build/Release/lib$(LIB).a $@

lib$(LIB)-osx-universal.a: $(PLATFORM_LIBS)
	lipo -create -output lib$(LIB)-osx-universal.a $^

clean:
	rm -f $(PLATFORM_LIBS)
	rm -rf build