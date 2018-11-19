.data
	state: .space 32
	key: .space 10
	IV: .space 10
.text


dataInitialization:
	#index
	addi $t1, $zero, 4
	addi $t0, $zero, 0
	addi $t5, $zero, 8
	sb  $t5, IV($t0)	
	sw $t1, state($t0)
	sb $t1, key($t0)
	addi $t0, $t0, 1
	sb $t1, key($t0)
	addi $t0, $t0, 1
	sb $t1, key($t0)
	addi $t0, $t0, 1
	sb $t1, key($t0)
	addi $t0, $t0, 1
	sb $t1, key($t0)
	addi $t0, $t0, 1

	#jumping to the end of array
#	addi $t0, $zero, 68
#	sw $t1, state($t0)	
#	lw $t3, state($t0)
	
	#load key in to the state
	addi $t0, $zero, 0
	keyLoop:
		lb $t1, key($t0)
		sb $t1, state($t0)
		addi $t0, $t0, 1
		beq $t0, 10, keyExit
		j keyLoop	
	
	keyExit:
	
	addi $t0, $zero, 12
	addi $t2, $zero, 0
	IVLoop:
		lb $t1, IV($t2)
		sb $t1, state($t0)
		addi $t0, $t0, 1
		addi $t2, $t2, 1
		
		beq $t2, 10, IVExit
		j IVLoop	
	
	IVExit:
	
	
	li $v0,1
	addi $a0, $t1, 0
	syscall

	



mainContunation:




bitwiseOperations:




BitwiseShift:



