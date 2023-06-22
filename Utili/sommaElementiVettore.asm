.data
vett: .word 5, 7, 3, 4, 3
.result: .word 0
.text
.globl main
.ent main

main:
  la $t1, vett
  and $t3,$0,$0 # index
  and $t4,$0,$0 # temp reguster
lab1: 
  lw $t0,($t1) # load first element from vett
  add $t4,$t4,$t0 # add to the temp register
  addi $t3,$t3,1 # update index
  addi $t1,$t1,4
  bne $t3,5,lab1 # 5 times
  
  la $t1,result
  sw $t4,($t1) # write result to memory
  
  li $v0,10
  syscall
.end main  
