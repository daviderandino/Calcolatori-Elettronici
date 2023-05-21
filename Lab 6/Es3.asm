.data
string: .ascii "ciao"

.text
.globl main
.ent main

main: add $t0,$0,$0
	add $t1,$t1,4 # len parola

ciclo: lbu $a0,string($t0)
	 jal converti
	 
	 sb $v0,string($t0)
	 addi $t0,$t0,1
	 
       bne $t0,$t1,ciclo
	 

	 li $v0,4
	 la $a0,string
	 syscall

	 li $v0,10
	 syscall
	 .end main

converti: sub $a0,$a0,32
	    move $v0,$a0
	    jr $ra

.end converti