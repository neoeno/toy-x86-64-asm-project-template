.global _start # Declare the entry point of the program

_start:
  mov $14, %rdi     # Put the length of the message into register rdi
  lea message, %rsi # Load the address of the message into register rsi
  call print        # Call the print subroutine

  mov $0, %rdi      # Put the exit code into register rdi
  jmp exit          # Jump to the exit function

print:           # Pass in: rdi = length, rsi = message address
  mov $1, %rax   # Put syscall number 1 (write) into rax to specify syscall
  mov %rdi, %rdx # Move length of message from rdi (1st arg) to rdx (3rd arg)
  mov $1, %rdi   # Put file descriptor 1 (STDOUT) into rdi (1st arg)
                 # Note address of string is already in rsi (2nd arg)
  syscall        # Execute the syscall
  ret            # Return to the caller

exit:            # Pass in: %rdi = exit code
  mov $60, %rax  # Put syscall number 60 (exit) into rax to specify syscall
  syscall        # Execute syscall, terminating program

# Encode an ASCII string and point the label `message` at its address
message:
  .ascii "Hello, world!\n"
