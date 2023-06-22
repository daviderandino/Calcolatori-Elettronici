LEN = 4
.data
testoInChiaro: .asciiz "calcolatorielettronici"
verme:	       .asciiz "mips"
testoCifrato:  .space 23
	.text
	.globl main
	.ent main

main: la $a0, testoInChiaro
      la $a1, verme
      li $a2, LEN
      la $a3, testoCifrato
      jal cifrarioVigenere

      jr $ra
      .end main

cifrarioVigenere: 

 and $t6, $0, $0 #CONTATORE 
 and $t5, $0, $0 #INDICE STR 
 li $t7, OFF 
 
 CicloStr: 
 
 lb $t0, ($a0) 
 beq $t0, 0x00, FINE 
  
 div $t5, $a2 
 mfhi $t1   #RESTO DIV PER LUN VERME 
 add $t1, $t1, $a1 #TROVO CARATTERE VERME PER FARE CIFRATURA 
 lb $t2, ($t1) 
 addi $t2, $t2, -97 
 add $t2, $t2, $t0 
  
 #NORMALIZZAZIONE DI $T2, SUPERATO Z DEVE RIPARTIRE DA A 
 ble $t2, Z, OK 
 sub $t2, $t2, $t7 
  
  
 OK: 
 sb $t2, ($a3) 
 addi $t6, $t6, 1 
 addi $a3, $a3, 1 
 addi $a0 ,$a0, 1 
 addi $t5, $t5, 1 
 bne $t0, 0x00, CicloStr 
  
  
 FINE: 
 move $v0, $t6 
 jr $ra 
  
 
 .end cifrarioVigenere