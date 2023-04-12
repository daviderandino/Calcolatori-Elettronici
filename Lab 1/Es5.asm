.text
.globl main
.ent main

# Utilizzare syscall 5 per leggere da tastiera e salvare in registri
# Da completare...

main:

	li $v0,5
	syscall
	move $t1,$v0
	li $v0,5
	syscall
	move $t2,$v0
		
	li $v0,10
	syscall
	.end main