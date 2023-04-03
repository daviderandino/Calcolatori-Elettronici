# Somma di 2 valori contenuti in due variabili
# e memorizzazione del risultato in una variabile
# wOpd1: .word 10
# wOpd2: .word 24
# wResult: .space 4

.data
wOpd1: .word 10
wOpd2: .word 24
wResult: .space 4
.text
.globl main
.ent main
main:
	la $t0,wOpd1
	lw $t1,($t0)
	la $t0,wOpd2
	lw $t2,($t0)
	add $t3,$t1,$t2
	
	la $t0,wResult
	sw $t3,($t0)

	li $v0,10
	syscall
.end main