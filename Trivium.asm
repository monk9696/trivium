.data
	state: .space 12
	key: .space 3
	IV: .space 3
.text


dataInitialization:
	
	#key and Iv intialization
	
	# To be redone for better allocaiton of the key and IV
	addi $t0, $zero, 0
	addi $t1, $zero, 4
	addi $t2, $zero, 8
	sb  $t2, IV($t0)	
	sw $t1, state($t0)
	sb $t1, key($t0)
	sb $t2, IV($t0)
	addi $t0, $t0, 1
	addi $t1, $t1, 3
	sb $t1, key($t0)
	sb $t2, IV($t0)
	addi $t0, $t0, 1
	addi $t1, $t1, 3
	sb $t1, key($t0)
	sb $t2, IV($t0)
	addi $t0, $t0, 1
	addi $t1, $t1, 3
	
	#load key in to the state
	addi $t0, $zero, 0
	keyLoop:
	#loop through the Key array till the end loading the bytes into the state
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
	#loop through the Iv array till the end loading the bytes into the state
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
	
	#Load from the array location into the saved registers for easy access and manipulation
	addi $t0, $zero, 0
	lw $s0, state($t0)
	addi $t0, $t0, 4
	lw $s1, state($t0)
	addi $t0, $t0, 4
	lw $s2, state($t0)	
	
	#clear the t registers used
	addi $t0, $zero, 0
	addi $t1, $zero, 0
	addi $t2, $zero, 0	
	j mainContinuation

	

mainContinuation:
	#looping structure to loop through the state 4 times
	#
	
	


bitwiseOperations:
	#For calculating the new bits added to the front of their respective sections
	#


BitwiseShift:
	#For doing the bit shift for the cycling and adding the values calculated in bitwiseOperations to the registers
	
	#shifts the bits properly so the registers are ready to recieve 
	sll $s0, $s0, 1
	sll $s1, $s1, 1
	sll  $s2, $s2, 1
	addi $t0, $zero, 0
	sw $s0, state($t0)
	addi $t0, $t0, 4
	sw $s1, state($t0)
	addi $t0, $t0, 4
	sw $s2, state($t0)	
	
	#Load in the values created in bitwiseOperations to their respective registers
	#
	
	
Exit:
	#For exiting out of the loop and ending the program when the cipher is completed
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
