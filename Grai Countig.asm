.data
prompt:    .asciz "How many grains do you have in litres: "
error:     .asciz "Error: Please enter a non-negative integer.\n"
result1:   .asciz "It makes this many makopokopo (20L): "
result2:   .asciz "\nAnd the remainder in litres is: "

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
    mv t0, a0          # store input n in t0

    # If n < 0, print error and exit
    blt t0, x0, print_error

    # Calculate makopokopo count and remainder
    li t1, 20          # divisor (20 litres per makopokopo)
    div t2, t0, t1     # t2 = n / 20
    rem t3, t0, t1     # t3 = n % 20

    # Print result1 label
    la a0, result1
    li a7, 4
    ecall

    # Print quotient (makopokopo count)
    mv a0, t2
    li a7, 1
    ecall

    # Print result2 label
    la a0, result2
    li a7, 4
    ecall

    # Print remainder (litres left)
    mv a0, t3
    li a7, 1
    ecall

    j exit

print_error:
    la a0, error
    li a7, 4
    ecall

exit:
    li a7, 10
    ecall
