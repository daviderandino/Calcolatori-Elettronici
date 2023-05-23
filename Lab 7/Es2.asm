.data
.text
.globl main
.ent main

main:
	li $v0,5 # utente inserisce intero
	syscall
	move $a0,$v0 # metto l'intero inserito dall'utente in $a0
	jal successivo # chiamo la procedura

	move $a0,$v0 # $v0 contiene il valore di ritorno, sposto in $a0 per stamparlo
	li $v0,1
	syscall

	li $v0,10
	syscall
	.end main

successivo:
	andi $t1, $a0, 1 # andi permette di verificare facilmente se un numero è pari o dispari: isolo il LSB e lo salvo in $t1
	beqz $t1, pari
	mul $a0,$a0,3
	addi $a0,$a0,1
	move $v0,$a0 # $v0 contiene il valore di ritorno
	j fine

pari:
	srl $a0, $a0, 1 # shift a destra di un bit => divisione per due
	move $v0,$a0 # $v0 contiene il valore di ritorno
	

fine:
	jr $ra



----------------
