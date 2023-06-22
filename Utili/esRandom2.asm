# calcola somma elementi diagonale matrice


.data
DIM = 4
matrice: .word 1, 2, 3, 4
         .word 5, 6, 7, 8
         .word 9, 10, 11, 12
         .word 13, 14, 15, 16

.text
.globl main
.ent main

main:
    la $a0, matrice
    li $a1, DIM
    jal sommaDiag
    move $t0, $v0

    li $v0, 10
    syscall
.end main

sommaDiag:
	move $t0,$a0 # indirizzo matrice
	move $t1,$a1 # DIM
	mul $t2,$t1,$t1 # DIM reale trattando matrice in row-major
	addi $t3,$t3,0 # indice
	add $t6,$0,$0
	addi $t7,$t1,1
ciclo:
	lw $t4,($t0)
	div $t3,$t7
	mfhi $t5
	beqz $t5,somma
	j else

somma:
	add $t6,$t6,$t4
else:
	
	addi $t0,$t0,4
	addi $t3,$t3,1
	blt $t3,$t2,ciclo

fine:
	move $v0,$t6
	jr $ra


	
.end sommaDiag
