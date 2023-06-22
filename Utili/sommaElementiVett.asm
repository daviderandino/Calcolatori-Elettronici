
# avessi avuto un vettore di byte serviva un lb, e incrementare indirizzo di 1 invece che di 4


DIM = 5

.data
vetRX: .word 1, 2, 3, 4, 5

.text
.globl main
.ent main

main:
    la $a0, vetRX
    li $a1, DIM
    jal somma

    move $t0,$v0
    li $v0, 10
    syscall

.ent somma
somma:
    move $t0, $a0 
    li $t2, 0      
    move $t2, $a1
    li $t3, 0     
    li $t4, 0     

ciclo:
    lw $t1, ($t0) 
    add $t4, $t4, $t1
    addi $t0, $t0, 4
    addi $t3, $t3, 1
    bne $t3, $t2, ciclo

fine:
    move $v0, $t4
    jr $ra

.end somma