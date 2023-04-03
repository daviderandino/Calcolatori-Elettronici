# Somma degli elementi di un Vettore (II) con un loop

.data
wVett: .word 5, 7, 4, 3
wResult: .space 4

.text
.globl main
.ent main
main:
	la $t1,wVett 	#carico indirizzo di wVett in $t1
	and $t3,$0,$0	#inizializzo $t3: sarà l'indice
	and $t4,$0,$0 	#inizializzo $t4: sarà il registro temporaneo
et:	lw $t0,($t1)  	#carico in $t0 la parola il cui indirizzo sta in $t1
	add $t4,$t4,$t0 	#aggiorno il registro temporaneo
	addi $t3,$t3,1 	#aggiorno l'indice che serve per la verifica in bne
	addi $t1,$t1,4 	#aggiungo 4 all'indirizzo di t1 per poter caricare l'int successivo
	bne $t3,4,et
	
	la $t1,wResult
	sw $t4,($t1)
	
	li $v0,10
	syscall
.end main
