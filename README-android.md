## Build boost_1_63_0 for Android-21+ under Windows64.**

Assuming NDK installed to `C:\android-sdk\ndk-bundle` and boost in `c:\boost_1_63_0`.

Install mingw: [using msys2-x86_64 from MSYS2][1]

Install build tools from mingw prompt (something like this):

<!-- language: lang-none -->

    $ pacman -S gcc binutils

Create android.clang.jam file in `C:\boost_1_63_0\` with such text content:

<!-- language: lang-none -->

    import os ;
    local AndroidNDKRoot = C:/android-sdk/ndk-bundle ;
    using clang : android
    :
    C:/android-sdk/toolchain21/bin/clang++
    :
    <compileflags>-fexceptions
    <compileflags>-frtti
    <compileflags>-fpic
    <compileflags>-ffunction-sections
    <compileflags>-funwind-tables
    <compileflags>-Wno-psabi
    <compileflags>-march=armv7-a
    <compileflags>-mfloat-abi=softfp
    <compileflags>-mfpu=vfpv3-d16
    <compileflags>-fomit-frame-pointer
    <compileflags>-fno-strict-aliasing
    <compileflags>-finline-limit=64
    <compileflags>-I$(AndroidNDKRoot)/platforms/android-21/arch-arm/usr/include
    <compileflags>-Wa,--noexecstack
    <compileflags>-DANDROID
    <compileflags>-D__ANDROID__
    <compileflags>-DNDEBUG
    <compileflags>-O2
    <compileflags>-I$(AndroidNDKRoot)/sources/cxx-stl/gnu-libstdc++/4.9/include
    <compileflags>-I$(AndroidNDKRoot)/sources/cxx-stl/gnu-libstdc++/4.9/libs/armeabi/include
    <architecture>arm
    <compileflags>-fvisibility=hidden
    <compileflags>-fvisibility-inlines-hidden
    <compileflags>-fdata-sections
    <cxxflags>-D__arm__
    <cxxflags>-D_REENTRANT
    <cxxflags>-D_GLIBCXX__PTHREADS
    ;

Setup boost from mingw prompt:


<!-- language: lang-none -->

    $ export NDK=/c/android-sdk/ndk-bundle
    $ echo ensure msi-installed Python is on path (not msys version):
    $ export PATH=/c/Python27:$PATH
    $ $NDK/build/tools/make_standalone_toolchain.py --arch arm --api 21 --install-dir /c/android-sdk/toolchain21
    $ ./bootstrap.sh --with-toolset=gcc
    $ ./b2 --user-config=android.clang.jam threading=multi link=static \
    runtime-link=static toolset=clang-android target-os=linux \
    threadapi=pthread --stagedir=android --with-chrono \
    --with-program_options --with-system --with-thread --with-random \
    --with-regex

  [1]: http://msys2.github.io/
