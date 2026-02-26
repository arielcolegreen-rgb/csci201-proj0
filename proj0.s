.data
id: .asciiz "@03066907"

.text
.globl main

main:

    li $t0, 12      # N
    li $t1, 1       # m = 1

    li $v0, 10
    syscall

forward_part2:
    la $t6, id

forward_part3:
    add $t7, $t5, $t4
    beq $t6, $t7, forward_finish

    lb $a0, 0($t6)
    li $v0, 11
    syscall

    addi $t6, $t6, 1
    j forward_part3