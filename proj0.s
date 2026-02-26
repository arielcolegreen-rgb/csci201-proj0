.data
id: .asciiz "@03066907"

.text
.globl main

main:

    li $t0, 12      # N
    li $t1, 1       # m = 1

    li $v0, 10
    syscall