.data
  
.text
.globl main

main:
	# (15 - 3) % 2
	li $t0, 15
	li $t1, 3
	
	sub $t0, $t0, $t1 # (15 - 3 ) = 12
	
	li $t1, 0 # t1 initial value
	li $t2, 2 # t2 initial value
	
while: 	
	# t0 = quotent*k + remainder
	# t0 = t1 + remainder ; t2 = t1 * 2 as a barricade for t1 not to exceed t0
	
	bgt $t2, $t0, done # t1 <= t0 condition
	
	addi $t1, $t1, 2
	
	addi $t2, $t1, 2
		
	j while	# repeat

done:	
	#remainder as ( dividend ) - ( divider * quotient ) = remainder
	sub $t0, $t0, $t1

	#display (15 - 3) % 2 = 0
		
	li $v0, 1
    	move $a0, $t0
    	syscall
    	
	li $v0, 10
	syscall	 