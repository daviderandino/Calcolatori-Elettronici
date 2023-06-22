N = 3
M = 4
          .data
matriceA: .word 1 2 3 4
	  .word	5 6 7 8
 	  .word	9 10 11 12
matriceB: .word 3 4 5 6
	  .word	7 8 9 10
	  .word	11 12 13 14
	  .word	15 16 17 18
matriceC: .space N * M * 4
      .text
      .globl main
      .ent main
main: subu $sp, $sp, 4
      sw $ra, ($sp)
      la $a0, matriceA
      la $a1, matriceB
      la $a2, matriceC
      li $a3, N
      li $t0, M
      subu $sp, $sp, 4
      sw $t0, ($sp)
      jal MediaMatrice
      addiu $sp, $sp, 4
      lw $ra, ($sp)
      addiu $sp, $sp, 4
      jr $ra

      move $t1,$v0	
      .end main 

MediaMatrice:

	 move $t0,$a0 # indirizzo matriceA
	 move $t1,$a1 # indirizzo matriceB
	 move $t2,$a2 # indirizzo matriceC
	
	 lw $t3, ($a0) # elemento matriceA
	 lw $t4, ($a1) # elemento matriceB
	 lw $t5, ($a3) # elemento matriceC

	 lw $t6, 0($sp) # recupera M dallo stack
	 move $t7,$a3 # valore N
	 mul $t7,$t6,$t7 # M * N
	 add $t8,$0,$0 # indice
	 add $t9,$0,$0 # media
	 addi $s0,$s0,2

ciclo:
	addu $t9,$t9,$t3 # calcolo la media e la scrivo in $t9
	addu $t9,$t9,$t4
	div $t9,$s0
	mflo $t9

	sw $t9,($t2) # metto media in $t2

	addiu $t0,$t0,4 # incremento indirizzi
	addiu $t1,$t1,4
	addiu $t2,$t2,4
	addi $t8,$t8,1 # incremento indice
	move $t9,$0 # reset media
	ble $t8,$t7,ciclo

fine:	
	move $v0,$t9
	jr $ra

.end MediaMatrice