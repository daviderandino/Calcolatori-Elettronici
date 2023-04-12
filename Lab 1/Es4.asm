# inizializzare var
# memorizzare in $t1 il doppio di var
# porre 40 nel registro $t2 e poi sommare $t1 e $t2


	.data
var:  .word 0x3FFFFFF0

	.text
	.globl main
	.ent main

main: la $t0,var
	and $t1,$0,$0
	lw $t1,($t0)
	mul $a0,$t1,2
	
	li $t2,40
	add $a0,$a0,$t2
	

	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
	.end main
	

# l'operazione genera overflow. L'overflow viene segnalato con add e addi
# addu e addiu non scatenano alcuna eccezione: in questo caso l'overflow lo si verifica confrontando il segno del risultato con quello degli operandi
# cioè: se la somma di due operandi con lo stesso segno produce un risultato di segno opposto, allora c'è overflow.