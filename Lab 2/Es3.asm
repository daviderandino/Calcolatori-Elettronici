.data
	aa: .word 4
	bb: .word 1
	cc: .word 3
	
.text
.globl main
.ent main

main:
	
	lw $t0,aa
	
	lw $t1,bb
	
	lw $t2,cc
	
	bgt $t0,$t1,swapAB
L1:	bgt $t0,$t2,swapAC
L2:	bgt $t1,$t2,swapBC
	j FINE

	
	swapAB:
		add $t0,$t0,$t1
		sub $t1,$t0,$t1
		sub $t0,$t0,$t1 
		j L1
		
	swapAC:
		add $t0,$t0,$t2
		sub $t2,$t0,$t2
		sub $t0,$t0,$t2
		j L2
	
	swapBC:
		add $t1,$t1,$t2
		sub $t2,$t1,$t2
		sub $t1,$t1,$t2
		j FINE
	
	FINE:
		li $v0,1		# stampa della prima variabile
		add $a0,$t0,$0
		syscall

		li $v0, 11		# stampa spazio
		li $a0, '\n'
		syscall

		li $v0,1		# stampa della seconda variabile
		add $a0,$t1,$0
		syscall

		li $v0, 11		# stampa spazio
		li $a0, '\n'
		syscall

		li $v0,1		# stampa della terza variabile
		add $a0,$t2,$0
		syscall
		
		li $v0,10		# fine
		syscall
		.end main