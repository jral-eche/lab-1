.data
prompt:    .asciz "How many cattle do you have: "
error:     .asciz "Error: Please enter a non-negative integer.\n"
result1:   .asciz "Not enuogh for bohali\n  "
result2:   .asciz "Small herd\n "
result3:   .asciz "Wealthy cattle owner\n"

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

    # Check thresholds
    li t1, 5         # lower limit for small herd
    li t2, 20        # lower limit for wealthy
    
    blt t0, t1, not_enough_label  # if n < 5 ? not enough
    blt t0, t2, small_herd_label  # if n < 20 ? small herd
    j wealthy_label                # else ? wealthy

not_enough_label:
    la a0, not_enough
    li a7, 4
    ecall
    j exit

small_herd_label:
    la a0, small_herd
    li a7, 4
    ecall
    j exit

wealthy_label:
    la a0, wealthy
    li a7, 4
    ecall
    j exit


print_error:
    la a0, error
    li a7, 4
    ecall

exit:
    li a7, 10
    ecall
