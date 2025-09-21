.data
prompt:      .asciz "\nEnter day number (1-7): "
newline:     .asciz "\n"
mantaha:     .asciz "Mantaha\n"
labobeli:    .asciz "Labobeli\n"
laboraro:    .asciz "Laboraro\n"
labone:      .asciz "Labone\n"
labohlano:   .asciz "Labohlano\n"
moqebelo:    .asciz "Moqebelo\n"
sontaha:     .asciz "Sontaha\n"
err_msg:     .asciz "Error: please enter a number from 1 to 7.\n"

.text
.globl _start
_start:
    # Print prompt
    la a0, prompt
    li a7, 4
    ecall

    # Read integer input into a0
    li a7, 5
    ecall
    mv t0, a0           # t0 = input n

    # Validate range: if n < 1 or n > 7 -> error
    li t1, 1
    blt t0, t1, print_error
    li t1, 7
    bgt t0, t1, print_error

    # Compare and branch to correct label
    li t1, 1
    beq t0, t1, do_mantaha
    li t1, 2
    beq t0, t1, do_labobeli
    li t1, 3
    beq t0, t1, do_laboraro
    li t1, 4
    beq t0, t1, do_labone
    li t1, 5
    beq t0, t1, do_labohlano
    li t1, 6
    beq t0, t1, do_moqebelo
    li t1, 7
    beq t0, t1, do_sontaha

    # Fallback (shouldn't happen because of range check)
    j print_error

do_mantaha:
    la a0, mantaha
    li a7, 4
    ecall
    j done

do_labobeli:
    la a0, labobeli
    li a7, 4
    ecall
    j done

do_laboraro:
    la a0, laboraro
    li a7, 4
    ecall
    j done

do_labone:
    la a0, labone
    li a7, 4
    ecall
    j done

do_labohlano:
    la a0, labohlano
    li a7, 4
    ecall
    j done

do_moqebelo:
    la a0, moqebelo
    li a7, 4
    ecall
    j done

do_sontaha:
    la a0, sontaha
    li a7, 4
    ecall
    j done

print_error:
    la a0, err_msg
    li a7, 4
    ecall

done:
    # Exit
    li a7, 10
    ecall
