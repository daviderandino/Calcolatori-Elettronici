.data
vett: .word 5, 7, 3, 4, 3
.result: .word 0
.text
.globl main
.ent main

main:
  la $t1, vett
  and $t3,$0,$0
  and $t4,$0,$0
lab1: 
  lw $t0,($t1)
  add $t4,$t4,$t0
  addi $t3,$t3,1
  addi $t1,$t1,4
  bne $t3,5,lab1
  
  la $t1,result
  sw $t4,($t1)
  
  li $v0,10
  syscall
.end main  
  
  
  
