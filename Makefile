# You can probably supplant these for gcc and gdb if you like, but I gather
# the error messages aren't as good
AS = clang
DBG = lldb

# This will use GCC ld - probably fine but you can also install lld and use ld.lld
LD = ld

build-main: build-dir
	$(AS) -Wall -g -o build/main.o -c src/main.s
	$(LD) -o build/main build/main.o

check:
	@arch | grep -q x86_64 && echo "SUCCESS: Running on x86_64" || echo "ERROR: Running on non-x86_64, but it might still work"
	@which $(AS) > /dev/null && echo "SUCCESS: $(AS) is installed" || echo "ERROR: $(AS) not found, please install clang or change Makefile to use gcc"
	@which $(LD) > /dev/null && echo "SUCCESS: $(LD) is installed" || echo "ERROR: $(LD) not found"
	@which $(DBG) > /dev/null && echo "SUCCESS: $(DBG) is installed" || echo "ERROR: $(DBG) not found, please install lldb or change Makefile to use gdb"

build-dir:
	if [ ! -d build ]; then mkdir build; fi

run: build-main
	./build/main

debug: build-main
	$(DBG) ./build/main
