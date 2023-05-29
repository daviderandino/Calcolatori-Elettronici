.data
	v1: .word 12, 47
	v2: .word 18, 14
.text
.globl main
.ent main

main:
	la $a0, v1
	la $a1, v2
	addi $a2,$0,1
	addi $a3,$0,40
	jal costoParcheggio
	
	move $a0,$v0
	li $v0,1
	syscall
	
	li $v0,10
	syscall
	.end main


costoParcheggio:
	#t0 contiene somma minuti
	add $t0,$0,$0
 	
	lw $t1,($a0) # carico in $t1 il valore il cui indirizzo sta in $a0
	lw $t2,($a1)
	sub $t2,$t2,$t1 # calcolo prima i minuti a partire dalle ore
	add $t0,$t0,$t2
	mul $t0,$t0,60

	addi $a0, $a0, 4 # incremento indirizzo vettori, poi li ricarico in $t1,$t2
	addi $a1, $a1, 4
	
	lw $t1,($a0)
	lw $t2,($a1)

	sub $t2,$t2,$t1 # calcolo ora i minuti rimanenti, in pratica faccio v1[1] - v2[1]
	add $t0,$t0,$t2

	div $t0,$a3 # il risultato della divisione finisce nei registri lo (quoziente) e hi (resto), a cui non posso accedere direttamente

	mflo $t3 
	mfhi $t4

 	move $v0,$t3
	bne $t4,0,aggiungi # se il resto è diverso da zero devo aggiungere 1
	mul $v0,$v0,$a2
	jr $ra
	

aggiungi:
	addi $v0,$v0,1
	mul $v0,$v0,$a2
	jr $ra

.end costoParcheggio

