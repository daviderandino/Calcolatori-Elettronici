.data
.text
.globl main
.ent main

main:
	jal stampaTriangolo
	jal stampaQuadrato
	li $v0,10
	syscall
	.end main
stampaTriangolo:
	li $t0,1
	li $v0,11
cicloRigheTriangolo:
	li $a0,'*'
	li $t1,0
cicloColonneTriangolo:
	syscall
	addi $t1,$t1,1
	bne $t1,$t0,cicloColonneTriangolo
	li $a0,'\n'
	syscall
	addi $t0,$t0,1
	bne $t0,9,cicloRigheTriangolo
	jr $ra
.end stampaTriangolo

stampaQuadrato:
	li $v0,11
	li $a0,'\n'
	syscall
	li $t0,0
	li $v0,11
cicloRigheQuadrato:
	li $a0,'*'
	li $t1,0
cicloColonneQuadrato:
	syscall
	addi $t1,$t1,1
	bne $t1,8,cicloColonneQuadrato
	li $a0,'\n'
	syscall
	addi $t0,$t0,1
	bne $t0,8,cicloRigheQuadrato
	jr $ra
.end stampaQuadrato