.data
	array: .space 72
	key: .space 20
	IV: .space 20
.text
	
	#index
	addi $t1, $zero, 4
	addi $t0, $zero, 0
	sw $t1, array($t0)
	addi $t0, $zero, 68
	sw $t1, array($t0)	
	lw $t3, array($t0)
	
	li $v0,1
	addi $a0, $t3, 0
	syscall