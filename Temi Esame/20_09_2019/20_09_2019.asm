	.data
vet:    .word 15, 64, 9, 2, 4, 5, 9, 1, 294, 52, -4, 5

        .text
	.globl main
	.ent main

main:   subu $sp,$sp,4
	sw $ra,0($sp)

	la $a0,vet
	li $a1,12
	jal monotono

	move $t1,$v0
	move $t2,$v1

	lw $ra,0($sp)
	addiu $sp,$sp,4
	jr $ra	

monotono:
    addi $t0, $0, 1   # registro act
    addi $t1, $0, 1   # registro max
    add $t2, $0, $0   # registro ind
    add $t3, $0, $0   # registro indice vettore
    
    add $t4, $0, $a1 
    sub $t4, $t4, 1  # contiene N-1

    move $t5, $a0     # contiene indirizzo vettore

    ciclo:
        bge $t3, $t4, fine
        lw $t6, ($t5)    # contiene l'elemento corrente del vettore, vet[i]
        addi $t5, $t5, 4 # incremento indice vettore
        lw $t7, ($t5)    # contiene vet[i+1]
        blt $t6, $t7, incrementa
        j else

    incrementa:
        addi $t0, $t0, 1
        j next

    else:
        bgt $t0, $t1, modifica
        move $t0, $0
        addi $t0, $t0, 1
        j next

    modifica:
        move $t1, $t0
        move $t2, $t3
        sub $t2, $t2, $t1
        addi $t2, $t2, 1
        move $t0, $0
        addi $t0, $t0, 1

    next:
        addi $t3, $t3, 1
        blt $t3, $t4, ciclo

    fine:    
        move $v0, $t1
        move $v1, $t2
        jr $ra



--------- CODICE IN C

int monotono(int *vet,int N,int *pos){

    int act = 1, max=1, ind;

    for(int i=0;i<N-1;i++){
        if(vet[i]<vet[i+1]) act++;
        else{
            if(act > max){
                max = act;
                ind = i - max + 1;
            }
            act = 1;
        }
    }

    *pos = ind;
    return max;

}

----------------------------