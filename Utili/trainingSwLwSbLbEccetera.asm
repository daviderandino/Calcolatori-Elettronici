.data
DIM = 4
vett: .word 1, 2, 3, 4
.text
.globl main
.ent main

main:
	la $t0,vett
	lw $t1,4($t0) # in questo modo t1 contiene '2'
	
	addi $t0,$t0,4

	# se faccio un'altra lw usando sempre 4 come offset, $t1 conterrà 3

	lw $t1,4($t0)

	# adesso voglio cambiare il primo elemento del vettore
	addi $t0,$t0,-4
	addi $t2,$t2,10
	sw $t2,($t0)

	li $v0,10
	syscall
.end main