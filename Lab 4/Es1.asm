.data
	DIM = 20
	vett: .space DIM
.text
.globl main
.ent main

main:
	li $t0,0 # indice del vettore, va aumentato di 4 ogni volta che devo aggiungere un elemento al vettore
	li $t4,0 # contatore perchè riempio il vettore DIM volte
	addi $t1,$t1,1 # primo numero di Fibonacci
	addi $t2,$t2,1 # secondo numero di Fibonacci

	sw $t1,vett($t0) # scrivo in vett[0]
	addi $t0,$t0,4 # incremento vett così scriverò in vett[1]

	sw $t2,vett($t0)
	addi $t0,$t0,4
	
	addi $t4,$t4,2 # incremento contatore perchè ho già scritto due numeri nel vettore

	bne $t4,DIM,while # procedo finchè $t4 < DIM
	

while:
	# faccio in modo che vett[i] = vett[i-1] + vett[i-2]
	move $t3,$t2 
	add $t2,$t2,$t1
	move $t1,$t3

	sw $t2,vett($t0)
	
	addi $t0,$t0,4
	addi $t4,$t4,1
	bne $t4,DIM,while
	
fine:	
	li $v0,10		
	syscall
	.end main