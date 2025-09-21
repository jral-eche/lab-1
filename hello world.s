.data
 msg:
.asciz "Hello World\n" # Null-terminated string
.text
.globl _start
_start:
la a0, msg # Load address of string into a0
li a7, 4 # System call: print string 
ecall # Make the system call
li a7, 10 # System call: exit
ecall