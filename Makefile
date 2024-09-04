# You can probably supplant these for gcc and gdb if you like, but I gather
# the error messages aren't as good
AS = clang
DBG = lldb

# This will use GCC ld - probably fine but you can also install lld and use ld.lld
LD = ld

# We use .PHONY to tell make to always run these commands even if a file exists
# with the same name in this directory. For more information on .PHONY, see
# https://www.gnu.org/software/make/manual/html_node/Phony-Targets.html
.PHONY: build-main
build-main: build-dir
	$(AS) -Wall -g -o build/main.o -c src/main.s
	$(LD) -o build/main build/main.o

.PHONY: check
check:
	@arch | grep -q x86_64 && echo "SUCCESS: Running on x86_64" || echo "ERROR: Running on non-x86_64, but it might still work"
	@which $(AS) > /dev/null && echo "SUCCESS: $(AS) is installed" || echo "ERROR: $(AS) not found, please install clang or change Makefile to use gcc"
	@which $(LD) > /dev/null && echo "SUCCESS: $(LD) is installed" || echo "ERROR: $(LD) not found"
	@which $(DBG) > /dev/null && echo "SUCCESS: $(DBG) is installed" || echo "ERROR: $(DBG) not found, please install lldb or change Makefile to use gdb"

.PHONY: build-dir
build-dir:
	if [ ! -d build ]; then mkdir build; fi

.PHONY: run
run: build-main
	./build/main

.PHONY: debug
debug: build-main
	$(DBG) ./build/main
