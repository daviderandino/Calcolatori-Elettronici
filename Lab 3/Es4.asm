.data
	printMsg: .asciiz "\nInserisci un intero:\n"
	msgMedia: .asciiz "\nMedia:\n"
	DIM = 3
.text
.globl main
.ent main

main:
	and $t0,$0,$0 # inizializzo contatore
	and $t1,$0,$0 # inizializzo somma
	bne $t0,DIM,FOR # chiamo label ciclo for
	
FOR:		
	la $a0,printMsg # stampo messaggio di inserimento int (verrà stampato DIM volte)
	li $v0,4
	syscall
	addi $t0,$t0,1

	li $v0,5 # sommo intero a $t1 (verrà fatta la somma DIM volte)
	syscall
	add $t1,$t1,$v0
	bne $t0,DIM,FOR

	# ciclo terminato
	
  	la $a0,msgMedia # stampo media
	li $v0,4
	syscall

	div $t1,$t1,DIM

	li $v0,1
	move $a0,$t1
	syscall

	li $v0,10 # fine
	syscall
	.end main