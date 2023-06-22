.data
DIM = 4
vett: .word 1, 2, 3, 4
.text
.globl main
.ent main

main:
	la $a0,vett
	
	addi $t0,$t0,100
	sra $t0,$t0,1 # scala a dx di 1 bit ovvero divido per due
	sra $t0,$t0,1
	sll $t0,$t0,3 # riscalo a sx, di 3 bit => $t0 diventa 200

	li $v0,10
	syscall
.end main