.data
prompt: .asciz "\nEnter height of Mokorotlo: "
newline: .asciz "\n"

.text
.globl _start
_start:
    # Print prompt
    la a0, prompt
    li a7, 4
    ecall

    # Read integer input
    li a7, 5
    ecall
    mv t0, a0       # store input n in t0

    # Check if n <= 0
    blez t0, exit

    li t1, 1        # current line i = 1

line_loop:
    bgt t1, t0, exit   # if i > n, exit

    # Print spaces: spaces = n - i
    mv t2, t0
    sub t2, t2, t1     # t2 = n - i
space_loop:
    beqz t2, star_loop
    li a0, 32          # ASCII ' ' for space
    li a7, 11
    ecall
    addi t2, t2, -1
    j space_loop

    # Print stars: stars = i
star_calc:
    # Calculate stars = (2 * i) - 1
    slli t2, t1, 1      # t2 = i * 2
    addi t2, t2, -1     # t2 = (2*i) - 1

star_loop:
    beqz t2, print_newline
    li a0, 42           # ASCII '*' star
    li a7, 11
    ecall
    addi t2, t2, -1
    j star_loop
print_newline:
    la a0, newline
    li a7, 4
    ecall

    addi t1, t1, 1
    j line_loop

exit:
    li a7, 10
    ecall
