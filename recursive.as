Faddr	beq	0	1	base	// if n==0 base case
one	beq	1	2	base	// if n==r base case
	lw	0	6	one
	sw	5	7	Stack	// save return address to stack
	add	5	6	5	//sp++
	sw	5	1	Stack	// save n to stack
	add	5	6	5	//sp++
	sw	5	2	Stack	// save r to stack
	add	5	6	5	//sp++
	nor	6	6	6	// negate 6 (gives -1)
	add	6	1	1	// decrement n
	lw	0	4	Faddr
	jalr	4	7		// recursive call combination(n-1,r)
	
	lw	5	2	Stack	// load r from stack
	add	5	6	5	//sp--
	lw	5	1	Stack	// load n from stack
	add	5	6	5	//sp--
	lw	5	7	Stack	// load return address from stack
	add	5	6	5	//sp--

	jalr	7	6
		
base	lw	0	3	one	// return value is 1
ret	jalr	7	6		// jump back to return address
	halt
neg1	.fill	-1
one	.fill	1
