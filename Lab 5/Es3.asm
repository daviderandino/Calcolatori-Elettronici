.data
	msgA: .asciiz "\nInserisci a:\n"
	msgB: .asciiz "\nInserisci b:\n"
	msgC: .asciiz "\nInserisci c:\n"
	msgUnaSol: .asciiz "\nDue soluzioni coincidenti\n"
	msgNoSol: .asciiz "\nNon ha soluzioni\n"
	msgSol: .asciiz "\nDue soluzioni distinte\n"
	DIM = 20
	vett: .space DIM
.text
.globl main
.ent main

main:	
	li $v0,4 # chiedo all'utente di inserire a
	la $a0,msgA
	syscall

	li $v0,5 # salvo a in $t0
	syscall
	move $t0,$v0

	li $v0,4 # chiedo all'utente di inserire b
	la $a0,msgB
	syscall	

	li $v0,5 # salvo b in $t1
	syscall
	move $t1,$v0
	
	li $v0,4 # chiedo all'utente di inserire c
	la $a0,msgC
	syscall

	li $v0,5 # salvo c in $t2
	syscall
	move $t2,$v0

	mul $t4,$t1,$t1 # calcolo il determinante che sarà contenuto in $t4
	addi $t5,$t5,4
	mul $t5,$t5,$t0
	mul $t5,$t5,$t2
	sub $t4,$t4,$t5

	beq $t4,0,unaSol # se il determinante = 0 ho due soluzioni coincidenti
	
	slt $t5,$t4,0 # slt confronta $t4 e 0, se $t4 è minore di 0 scrive 1 nel registro $t5, altrimenti scrive 0
	beq $t5,1,noSol
	beq $t5,0,sol

sol:
	li $v0,4
	la $a0,msgSol
	syscall
	j fine

	
noSol:
	li $v0,4
	la $a0,msgNoSol
	syscall
	j fine	

unaSol:
	li $v0,4
	la $a0,msgUnaSol
	syscall
	j fine
	

fine:	
	li $v0,10		
	syscall
	.end main