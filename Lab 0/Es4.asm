# Somma degli elementi di un vettore (Versione 1)
# wVett: .word 5,7,3,4
# wResult: .space 4
# Tecnica molto semplice fatta di somme successive con un Registro come accumulatore.

.data
wVett: .word 5, 7, 3, 4
wResult: .space 4 

.text
.globl main
.ent main
main:
	la $t3,wVett 	#carico indirizzo di wVett in $t3
	and $t4,$0,$0	#inizializzo $t4 a zero: uso lui come accumulatore

	lw $t0,($t3)	#carico il primo elemento del vettore in $t0
	add $t4,$t4,$t0	#aggiorno $t4
	addi $t3,$t3,4	#aggiorno l'indice di $t3
	lw $t0,($t3)	#...Ripeto il procedimento altre tre volte
	add $t4,$t4,$t0
	addi $t3,$t3,4
	lw $t0,($t3)
	add $t4,$t4,$t0
	addi $t3,$t3,4
	lw $t0,($t3)
	add $t4,$t4,$t0
	addi $t3,$t3,4

	la $t3,wResult   	#carico nel registro $t3 l'indirizzo della variabile wResult
	sw $t4,($t3)	#prendo il registro $t4 e lo scrivo in memoria all'indirizzo contenuto in $t3
	
	li $v0,10
	syscall
.end main
	 
