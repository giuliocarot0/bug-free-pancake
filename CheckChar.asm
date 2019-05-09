.data
	msg1: .asciiz "Inserire val numerico: "
	msg2: .asciiz "\n Stop"
	msg3: .asciiz " -> Valid Char \n"
	msg4: .asciiz " -> Invalid Char \n"

	
	.text
	.globl main
	
main:

	li $v0, 4
	la $a0, msg1
	syscall
	
cyc: 
	li $v0, 12
	syscall
	beq $v0, 10, exit
	bgt $v0 '9' NaN
	blt $v0 '0' NaN
	li $v0, 4
	la $a0, msg3
	syscall
	j cyc

NaN:
	li $v0, 4
	la $a0, msg4
	syscall
	j cyc
	
exit:	
	li $v0, 4
	la $a0, msg2
	syscall
	li $v0, 10
	syscall 

.end main
	
