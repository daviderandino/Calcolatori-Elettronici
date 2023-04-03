# siano definite cinque variabili di tipo byte
# var1 = 'm', var2 = 'i', var3 = 'p', var4 = 's', var5 = 0
# si scriva un programma che converta in maiuscolo le prime 4 variabili
# successivamente stampare una stringa utilizzando la system call 4 e copiando in $a0 l'indirizzo di var1
# quali sono i caratteri stampati a video? A cosa serve var5?

	.data
var1:	.byte 'm'
var2: .byte 'i'
var3: .byte 'p'
var4: .byte 's'
var5: .byte 0
	
	.text
	.globl main
	.ent main

main: lb $t0, var1
	lb $t1, var2
	lb $t2, var3
	lb $t3, var4
	sub $t0, $t0, 32	# la subi non esiste, basta fare sub!
	sub $t1, $t1, 32
	sub $t2, $t2, 32
	sub $t3, $t3, 32
	sb $t0,var1
	sb $t1,var2
	sb $t2,var3
	sb $t3,var4

	lb $t4,var5
	
	li $v0,4
	la $a0,var1
	syscall
		
	li  $v0, 10
	syscall
	.end main