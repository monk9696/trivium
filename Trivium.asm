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
	addi $t2, $zero, 255
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
#t1
	
	addi $t4, $s0, 0
	sll $t4, $t4, 11
	srl $t4, $t4, 31
	
	
	addi $t5, $s0, 0
	sll $t5, $t5, 2
	srl $t5, $t5, 31
	
	addi $t6, $s0, 0
	sll $t6, $t6, 1
	srl $t6, $t6, 31
	
	addi $t7, $s0, 0
	srl $t7, $t7, 31

	addi $t8, $s1, 0
	sll $t8, $t8, 8
	srl $t8, $t8, 31
	
	
#BitwiseOps for T1
	
#t2	

#clear
	addi $t4, $zero, 0
	addi $t5, $zero, 0
	addi $t6, $zero, 0
	addi $t7, $zero, 0
	addi $t8, $zero, 0
	addi $t9, $zero, 0
	

	addi $t4, $s1, 0
	sll $t4, $t4, 11
	srl $t4, $t4, 31
	
	
	addi $t5, $s1, 0
	sll $t5, $t5, 2
	srl $t5, $t5, 31
	
	addi $t6, $s1, 0
	sll $t6, $t6, 1
	srl $t6, $t6, 31
	
	addi $t7, $s1, 0
	srl $t7, $t7, 31

	addi $t8, $s2, 0
	sll $t8, $t8, 8
	srl $t8, $t8, 31
	
	j Exit
#BitwiseOps for T2


#T3
	
#clear
	addi $t4, $zero, 0
	addi $t5, $zero, 0
	addi $t6, $zero, 0
	addi $t7, $zero, 0
	addi $t8, $zero, 0
	addi $t9, $zero, 0
	

	addi $t4, $s2, 0
	sll $t4, $t4, 11
	srl $t4, $t4, 31
	
	
	addi $t5, $s2, 0
	sll $t5, $t5, 2
	srl $t5, $t5, 31
	
	addi $t6, $s2, 0
	sll $t6, $t6, 1
	srl $t6, $t6, 31
	
	addi $t7, $s2, 0
	srl $t7, $t7, 31

	addi $t8, $s0, 0
	sll $t8, $t8, 8
	srl $t8, $t8, 31
	j Exit
#Bitwise Ops for T3

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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
