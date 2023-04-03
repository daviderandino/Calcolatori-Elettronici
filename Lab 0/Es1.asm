# scrittura di un valore in un registro
# $t0 valore 10 decimale
# $s0 valore DC esadecimale

.data
	x: .word 10
	y: .word 0xDC
.text
.globl main
.ent main
main:
	la $t1,x
	lw $t0,($t1)
	la $t2,y
	lw $s0,($t2)
	
	li $v0,10
	syscall
.end main
