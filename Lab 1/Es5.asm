.text
.globl main
.ent main

# Utilizzare syscall 5 per leggere da tastiera e salvare in registri
# Scambiare i valori senza utilizzare altri registri

main:

	li $v0,5
	syscall
	move $t0,$v0
	li $v0,5
	syscall
	move $t1,$v0
	add $t0,$t0,$t1
	sub $t1,$t0,$t1
	sub $t0,$t0,$t1 
	
		
	li $v0,10
	syscall
	.end main