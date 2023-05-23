.data
.text
.globl main
.ent main

main:
	addi $a0,$0,3
	addi $a1,$0,2
	addi $a2,$0,2
	addi $a3,$0,4
	jal calcolaDet

	move $t0,$v0

	li $v0,10
	syscall
	.end main
	

calcolaDet:
	addi $v0,$a0,0
	mul $v0,$v0,$a3
	mul $a1,$a1,$a2
	sub $v0,$v0,$a1
	jr $ra

.end calcolaDet