	.data
op1:	.byte 150
op2:  .byte 100

	.text
	.globl main
	.ent main

# bisogna usare lbu per il load di op1, perchè op1 > 128, con lb uso 8 bit e rappresento con segno fino a 2^7 = 128. lbu è unsigned, quindi uso tutti i 16 bit
# per qualche motivo questi commenti generano il crash del programma but still

main: lbu $t0, op1 
	lb $t1, op2
	add $a0, $t0, $t1
	add $t3, $t1, $t2
	
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
	.end main