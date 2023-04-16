.data
	printOk: .asciiz "\nInteri rappresentabili su 1 byte\n"
	printErr: .asciiz "\nInteri NON rappresentabili su 1 byte\n"

.text
.globl main
.ent main

main:
	li $v0,5
	syscall
	move $t1,$v0
	li $v0,5
	syscall
	move $t2,$v0
	addi $t3,$0,128
	addi $t4,$0,-127

	bgt $t1,$t3,stampaErr
	blt $t1,$t4,stampaErr
	bgt $t2,$t3,stampaErr
	blt $t2,$t4,stampaErr
	j PROCEDI

stampaErr:
	li $v0,4
	la $a0,printErr
	syscall
	li $v0,10		
	syscall
	.end main

PROCEDI:
	not $t4, $t2 # not B
	and $t4, $t1, $t4 # A and (not B)
	not $t4, $t4 # not (A and (not B))
	xor $t1, $t1, $t2 # A xor B
	or $t1, $t1, $t4 # not (A and (not B)) or (A xor B)

FINE:	
	li $v0,4
	la $a0,printOk
	syscall
	li $v0,10		
	syscall
	.end main