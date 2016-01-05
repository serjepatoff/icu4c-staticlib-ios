#!/bin/bash

cd source
    CURRENTPATH=`pwd`
    TOOLCHAIN="`xcode-select --print-path`/Toolchains/XcodeDefault.xctoolchain/usr/bin"
    CXXFLAGS="-stdlib=libstdc++ -std=gnu++11"
    LDFLAGS="-lstdc++ -stdlib=libstdc++"
    CXXFLAGS="$CXXFLAGS" CC="$TOOLCHAIN/clang" CXX="$TOOLCHAIN/clang++" LDFLAGS="$LDFLAGS" ./configure
    DIR=$CURRENTPATH

    cd common ; make install-headers includedir="$DIR/Headers/icu4c" ; cd ..
    cd i18n ; make install-headers includedir="$DIR/Headers/icu4c" ; cd ..
    cd io ; make install-headers includedir="$DIR/Headers/icu4c" ; cd ..
    cd layout ; make install-headers includedir="$DIR/Headers/icu4c" ; cd ..
    cd layoutex ; make install-headers includedir="$DIR/Headers/icu4c" ; cd ..

    cd common ; make install-headers includedir="$DIR/BuildHeaders/icu4c" ; cd ..
    cd i18n ; make install-headers includedir="$DIR/BuildHeaders/icu4c" ; cd ..
    cd io ; make install-headers includedir="$DIR/BuildHeaders/icu4c" ; cd ..
    cd layout ; make install-headers includedir="$DIR/BuildHeaders/icu4c" ; cd ..
    cd layoutex ; make install-headers includedir="$DIR/BuildHeaders/icu4c" ; cd ..
    cd ..

    find . -type f | LC_CTYPE=C xargs sed -i '' 's/include "unicode\\//include "/g'
    find . -type f | LC_CTYPE=C xargs sed -i '' 's/include "layout\\//include "/g'
    echo "
--- a/source/common/ubidi.c
+++ b/source/common/ubidi.c
1768c1768
<     Point point;
---
>     struct ICU4CPoint point;
--- a/source/common/ubidiimp.h
+++ b/source/common/ubidiimp.h
234c234
< typedef struct Point {
---
> typedef struct ICU4CPoint {
244c244
<     Point *points;          /* pointer to array of points */
---
>     struct ICU4CPoint *points;          /* pointer to array of points */
--- a/source/common/ubidiln.c
+++ b/source/common/ubidiln.c
689c689
<         Point *point, *start=pBiDi->insertPoints.points,
---
>         struct ICU4CPoint *point, *start=pBiDi->insertPoints.points,
--- a/source/i18n/rbnf.cpp
+++ b/source/i18n/rbnf.cpp
38c38
< #ifdef RBNF_DEBUG
---
> #ifdef DEBUG_ICU
331c331
< #ifdef RBNF_DEBUG
---
> #ifdef DEBUG_ICU
560c560
< #ifdef RBNF_DEBUG
---
> #ifdef DEBUG_ICU" | patch -p1
