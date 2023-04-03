# scrittura di un valore in una cella di memoria
# wVar deve contenere il valore 3

.data
	wVar: .word 3
.text
.globl main
.ent main
main:
	li $v0,10
	syscall
.end main