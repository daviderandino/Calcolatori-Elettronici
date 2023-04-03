# siano definite le seguenti variabili di tipo byte già inizializzate in memoria
# n1: .byte 10
# n2: .byte 0x10
# n3: .byte '1'
# sia inoltre defnita la variabile di tipo byte, non inizializzata, res
# si calcoli res = n1 - n2 + n3
     
     
     .data

n1:  .byte 10
n2:  .byte 0x10
n3:  .byte '1'
res: .space 1
     .text
     .globl main
     .ent main	

main:	lb $t0, n1
	lb $t1, n2
	sub $t0, $t0, $t1
	lb $t1, n3
	add $t0,$t0,$t1
	sb $t0, res
	
	li  $v0, 10
	syscall
	.end main
