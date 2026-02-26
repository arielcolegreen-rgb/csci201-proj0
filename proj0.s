.data
id: .asciiz "@03066907"

.text
.globl main

main:
    li $t0, 12      # N
    li $t1, 1       # m = 1
    j forward_loop

########################
# FORWARD LOOP
########################

forward_loop:
    bgt $t1, $t0, backward_setup

    # (m - 1) % 9
    addi $t2, $t1, -1
    li $t3, 9
    div $t2, $t3
    mfhi $t4

    la $t5, id
    add $t6, $t5, $t4

# print from start index to end
forward_part1:
    lb $a0, 0($t6)
    beqz $a0, forward_part2
    li $v0, 11
    syscall
    addi $t6, $t6, 1
    j forward_part1

# print beginning to start-1
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

forward_finish:
    li $v0, 11
    li $a0, 10
    syscall

    addi $t1, $t1, 1
    j forward_loop

backward_setup:
    li $t1, 1
    j backward_loop

########################
# EXIT
########################

exit_program:
    li $v0, 10
    syscall