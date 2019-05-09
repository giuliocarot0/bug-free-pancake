.data
	hh: 	.byte 47
	min:	.byte 4
	day:	.byte 14
    aaa:    .byte 1
	res:    .space 4 
.text
.globl main
.ent main

main:
	lbu $t0, day
	mul $t1, $t0, 24
	lbu $t0, hh
	add $t1, $t1, $t0
	mul $t1, $t1, 60
	lbu $t0, min
	addu $t1,$t1,$t0
	
	sw $t1, res
	
	li $v0, 1
	add $a0, $t1, $0
	syscall 
	
	
	li $v0, 10
	syscall 

.end main
