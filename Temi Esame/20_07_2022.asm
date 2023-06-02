.data
DIM: .word 5
costante: .word 12
intervalli: .byte 0, 2, 4, 7, 10

.text
.globl main
.ent main

main:
    subu $sp, $sp, 4
    sw $ra, ($sp)

    li $a0, 31
    li $a1, 25
    la $a2, intervalli
    la $a3, costante
    jal clima

    lw $ra, ($sp)
    addiu $sp, $sp, 4

    move $t0, $v0

    jr $ra

clima:
    blt $a0, $a1, else

    sub $t0, $a0, $a1  

    addi $t1, $0, 0    
    la $t2, intervalli  

loop:
    lb $t3, ($t2)       
    bge $t3, $t0, end  

    addi $t1, $t1, 1   
    addi $t2, $t2, 1  

    bne $t1, $a3, loop  

end:
    lw $t4, ($a3)      
    mul $v0, $t4, $t1  
    jr $ra

else:
    addi $v0, $0, -1  
    jr $ra

.end clima
