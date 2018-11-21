.data
	state: .space 12
	key: .space 3
	IV: .space 3
.text


dataInitialization:
	#index
	addi $t0, $zero, 0
	
	#key and Iv intialization
	addi $t1, $zero, 4
	addi $t0, $zero, 0
	addi $t5, $zero, 8
	sb  $t5, IV($t0)	
	sw $t1, state($t0)
	sb $t1, key($t0)
	sb $t5, IV($t0)
	addi $t0, $t0, 1
	addi $t1, $t1, 3
	sb $t1, key($t0)
	sb $t5, IV($t0)
	addi $t0, $t0, 1
	addi $t1, $t1, 3
	sb $t1, key($t0)
	sb $t5, IV($t0)
	addi $t0, $t0, 1
	addi $t1, $t1, 3
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
		beq $t0, 3, keyExit
		j keyLoop	
	
	keyExit:
	#load in the IV into the state
	addi $t0, $zero, 4
	addi $t2, $zero, 0
	IVLoop:
		lb $t1, IV($t2)
		sb $t1, state($t0)
		addi $t0, $t0, 1
		addi $t2, $t2, 1
		
		beq $t2, 3, IVExit
		j IVLoop	
	
	IVExit:
	
	#allocate the last byte
	addi $t0, $zero, 11
	addi $t1, $zero, 224
	sb $t1, state($t0)	
	addi $t0, $zero, 0
	lw $s0, state($t0)
	addi $t0, $t0, 4
	lw $s1, state($t0)
	addi $t0, $t0, 4
	lw $s2, state($t0)	
	
	j mainContinuation

	

mainContinuation:

	


bitwiseOperations:




BitwiseShift:

	sll $s0, $s0, 1
	sll $s1, $s1, 1
	sll  $s2, $s2, 1
	addi $t0, $zero, 0
	sw $s0, state($t0)
	addi $t0, $t0, 4
	sw $s1, state($t0)
	addi $t0, $t0, 4
	sw $s2, state($t0)	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	