# Toy Linux/x86-64 (AMD64) Assembly Project Template

This is a very simple template for an assembly project suitable for running on
x86-64 based architectures in a Linux compatible environment.

It prioritises having the fewest elements and easiest setup. As a result, it cuts
a few corners that you probably wouldn't want to cut in a professional project.

But if you're using assembly as a learning or hobby tool, this should suit you well.

## Quickstart

You will need `make`, `clang`, `ld`, and `lldb` installed.

```shell
# Install clang and lldb if you don't already have them
# ld and make are likely already there
; sudo apt install clang lldb

# Clone the repo, download a zip, or run...
; mkdir my-asm-project && cd my-asm-project
; npx degit neoeno/toy-x86-64-asm-project-template

# Check everything is installed
; make check

# To build and run `src/main.c`
; make run

# To start `src/main.c` in the debugger
; make debug
```

Note that a professional project would probably not use `make` for all of these tasks.

## How to write code

There is one code file, `main.s` which contains some example assembly code.

I suggest building on this foundation.
