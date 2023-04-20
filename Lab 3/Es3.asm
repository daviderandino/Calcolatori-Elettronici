		.data
risultato:  .space 4
giorni:	.byte 100	
ore:		.byte 21
minuti:	.byte 35
		.text
		.globl main
		.ent main

main:
	lbu $t0,giorni # carico giorni in $t0
	mul $t1,$t0,24 # t1 conterrà le ore dei giorni
	lbu $t0,ore # carico ore in $t0
	addu $t1,$t1,$t0 # aggiungo $t1 a $t0
	mul $t1,$t1,60 # converto le ore in minuti
	lbu $t0,minuti # carico i minuti in $t0
	addu $t0,$t1,$t0 # aggiungo minuti a $t1
	sw $t1,risultato # carico risultato in $t1
	
	li $v0,10
	syscall
	.end main
	
