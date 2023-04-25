.data
	printEnd: .asciiz "\nFine\n"
	printOk: .asciiz "\nNumero acquisito\n"
	printCont: .asciiz "\nNon hai inserito un numero,continua\n"
.text
.globl main
.ent main

main:
	j while

while:
	li $v0,12 # leggo un char
	syscall
	move $t0,$v0

	beq $t0,'\n',fine # se il char è il carattere invio termino il programma
	bgt $t0,'9',continua # se il char è un carattere non numerico richiedo all'utente di inserire un altro char
	blt $t0,'0',continua
	
	# una volta passati questi controlli, siamo certi che l'utente ha inserito un numero
	li $v0,4
	la $a0,printOk
	syscall

	j while

continua:
	li $v0,4
	la $a0,printCont
	syscall
	j while

fine:
	li $v0,4
	la $a0,printEnd
	syscall
		
	li $v0,10		
	syscall
	.end main
