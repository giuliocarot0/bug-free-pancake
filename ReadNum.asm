.data
	msg1: .asciiz "Inserire val numerico: "
	msg2: .asciiz "\n Input: "
	msg3: .asciiz " -> Valid Char \n"
	msg4: .asciiz " -> Invalid Char \n"

	
	.text
	.globl main
	
main:

	li $v0, 4
	la $a0, msg1
	syscall
	li $t2, 0
	
cyc: 
	li $v0, 1
	add $a0, $t2, $0
	syscall

	li $v0, 12
	syscall
	beq $v0, 10, exit
	bgt $v0 '9' NaN
	blt $v0 '0' NaN
	
	
	j acc

NaN:
	li $v0, 4
	la $a0, msg4
	syscall
	j exit
	
acc: 
    sub $t1, $v0, 48
	mul $t2, $t2, 10
	add $t2, $t2, $t1
	li $v0, 4
	la $a0, msg3
	syscall
	j cyc
	
exit:	
	li $v0, 4
	la $a0, msg2
	syscall
	li $v0, 1
	add $a0, $t2, $0
	syscall
	li $v0, 10
	syscall 
.end main
	
