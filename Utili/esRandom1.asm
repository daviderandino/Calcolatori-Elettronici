# conta elementi pari di un vettore

.data
DIM = 10
vett: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10

.text
.globl main
.ent main

main:
    la $a0, vett
    li $a1, DIM
    jal contaPari

    move $t0,$v0
    li $v0, 10
    syscall

contaPari:
    move $t0, $a0 # indirizzo vettore
    move $t1, $a1 # N vettore  
    add $t2, $0, $0 # indice
    addi $t7, $0, 2 # immediato per calcolare il resto

ciclo:
    lw $t3, ($t0) # elemento vettore
    div $t3, $t7 # calcolo resto, se è zero incremento contatore pari
    mfhi $t4      

    beqz $t4, aggiungi 

    j else

aggiungi:
    addi $t5, $t5, 1

else:
    addi $t0, $t0, 4 # incremento indirizzo vettore
    addi $t2, $t2, 1 # incremento indice
    blt $t2, $t1, ciclo # se indice < DIM ripeto ciclo

fine:
    move $v0, $t5
    jr $ra       
.end contaPari
