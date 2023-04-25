.data
	opa: .word 2043
	opb: .word 5
	res: .space 4
	msgInput: .asciiz "\nChe operazione vuoi fare?:\n"
	msgErr: .asciiz "\nInput non valido\n"
.text
.globl main
.ent main

main:
	la $t0,opa # carico il valore di opa nel registro $t1
	lw $t1,($t0)

	la $t0,opb # carico il valore di opa nel registro $t2
	lw $t2,($t0)
	
	la $a0,msgInput # chiedo all'utente che operazione vuole fare
	li $v0,4
	syscall
	
	li $v0,5 # inserisco in $t3 il codice che indica l'operazione da fare
	syscall
	add $t3,$0,$v0

	blt $t3,0,errore
	bgt $t3,3,errore

	# qua inizia una sorta di switch case, o una catena di 4 IF
	# salverò in $t4 il risultato dell'operazione

	beq $t3,0,sum
	beq $t3,1,diff
	beq $t3,2,prod
	beq $t3,3,dividi
	j end

errore:
	la $a0,msgErr
	li $v0,4
	syscall
	j end

sum:
	add $t4,$t1,$t2
	j end

diff:
	sub $t4,$t1,$t2
	j end

prod:
	mul $t4,$t1,$t2
	j end

dividi:	
	div $t4,$t1,$t2
	j end

end:
	la $t0,res # $t0 conterrà l'indirizzo di res
	sw $t4,($t0) # ricordiamo che sw prende $t4 e lo scrive in memoria all'indirizzo contenuto in $t0, ovvero l'indirizzo di res
	li $v0,10
	syscall
	.end main