# scrivere un programma che, acquisiti 4 valori da tastiera
# esegua f = (g+h) - (i+j)
# 1) Chiedere all'utente di inserire i valori
# 2) Ad acquisizione terminata, informare l'utente
# 3) Stampare a video il valore di f
# 4) Minimizzare l'uso dei registri
# 5) Salvare in memoria il risultato come word


.data
	printOk: .asciiz "\nAcquisizione effettuata con successo\n"
	printIns: .asciiz "\nInserisci intero:\n"
	f: .word 3
.text
.globl main
.ent main

main:

	li $v0,4
	la $a0,printIns
	syscall

	li $v0,5
	syscall
	move $t0,$v0

	li $v0,4
	la $a0,printIns
	syscall

	li $v0,5
	syscall
	move $t1,$v0

	li $v0,4
	la $a0,printIns
	syscall

	li $v0,5
	syscall
	move $t2,$v0

	li $v0,4
	la $a0,printIns
	syscall

	li $v0,5
	syscall
	move $t3,$v0

	li $v0,4
	la $a0,printOk
	syscall

	add $t0,$t0,$t1
	add $t2,$t2,$t3
	sub $t0,$t0,$t2 # t0 rappresenta la f
	
	li $v0,1
	move $a0,$t0
	syscall

	sw $t0,f
	
	li $v0,10
	syscall
	.end main