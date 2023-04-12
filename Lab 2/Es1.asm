.data
	printPari: .asciiz "\nNumero pari\n"
	printDispari: .asciiz "Numero dispari\n"

.text
.globl main
.ent main

main:

	li $v0,5
	syscall
	move $t1,$v0

	sll $t2,$t1,31 # scala a sinistra di 31 bit e metto il risultato in $t2
			   # in questo modo $t2 conterrà un solo bit che è 1 oppure 0

	beq $t2,0,PARI

	li $v0,4
	la $a0,printDispari
	syscall
	j END
	
	PARI:
		li $v0,4
		la $a0,printPari
		syscall
		j END
		
	END:
		li $v0,10
		syscall
		.end main