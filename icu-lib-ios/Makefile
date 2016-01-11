XBUILD=/Applications/Xcode.app/Contents/Developer/usr/bin/xcodebuild
PROJECT_ROOT=.
PROJECT=$(PROJECT_ROOT)/icu-lib-ios.xcodeproj
TARGET=icu-lib-ios
LIB=icu4c
PLATFORM_LIBS=lib$(LIB)-i386.a lib$(LIB)-x86_64.a lib$(LIB)-armv7.a lib$(LIB)-arm64.a

all: lib$(LIB)-universal.a

lib$(LIB)-i386.a:
	$(XBUILD) -project $(PROJECT) -target $(TARGET) -sdk iphonesimulator -arch i386 -configuration Release clean build
	mv $(PROJECT_ROOT)/build/Release-iphonesimulator/lib$(LIB).a $@

lib$(LIB)-x86_64.a:
	$(XBUILD) -project $(PROJECT) -target $(TARGET) -sdk iphonesimulator -arch x86_64 -configuration Release clean build
	mv $(PROJECT_ROOT)/build/Release-iphonesimulator/lib$(LIB).a $@

lib$(LIB)-armv7.a:
	$(XBUILD) -project $(PROJECT) -target $(TARGET) -sdk iphoneos -arch armv7 -configuration Release clean build
	mv $(PROJECT_ROOT)/build/Release-iphoneos/lib$(LIB).a $@

#lib$(LIB)-armv7s.a:
#	$(XBUILD) -project $(PROJECT) -target $(TARGET) -sdk iphoneos -arch armv7s -configuration Release clean build
#	mv $(PROJECT_ROOT)/build/Release-iphoneos/lib$(LIB).a $@
    
lib$(LIB)-arm64.a:
	$(XBUILD) -project $(PROJECT) -target $(TARGET) -sdk iphoneos -arch arm64 -configuration Release clean build
	mv $(PROJECT_ROOT)/build/Release-iphoneos/lib$(LIB).a $@

lib$(LIB)-universal.a: $(PLATFORM_LIBS)
	lipo -create -output lib$(LIB)-universal.a $^

clean:
	rm -f $(PLATFORM_LIBS)
	rm -rf build