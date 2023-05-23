.data
	DIM = 5
	vett: .word 5, 7, 23, 1, 5
.text
.globl main
.ent main

main:
	 la $a0,vett
	 li $a1,DIM
	 jal massimo

	 move $a0,$v0
	 li $v0,1
	 syscall
	
	 li $v0,10
	 syscall
	 .end main

massimo: 
	move $t0,$a0 # carico in $t0 il valore di $a0 passato come parametro
	move $t1,$a1 # carico in $t1 il valore di $a1 passato come parametro
	lw $v0,($t0) # $v0 conterrà il valore di $t0 che è un indirizzo
	
ciclo:
	add $t0,$t0,4 # aggiorno indirizzo
	sub $t1,$t1,1 # diminuisco contatore
	beqz $t1,fine # se ho finito di ciclare nel vettore vado in "fine" e ritorno al main chiamante
	lw $t2,($t0) # carico in $t2 il valore il cui indirizzo sta in $t0
	blt $t2,$v0,next # se $t2 è minore di $v0 procedo col ciclo
	move $v0,$t2 # altrimenti $v0 conterrà il max attuale, poi procedo col ciclo

next: j ciclo

fine: jr $ra
 	
.end massimo
