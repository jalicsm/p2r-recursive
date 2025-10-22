	lw	0	1	n
	lw	0	2	r
	lw	0	4	Faddr	load function address
	jalr	4	7		call function
	halt
Faddr	beq	0	2	base	// if r==0 base case
	beq	1	2	base	// if n==r base case
	sw	5	7	Stack	// save return address to stack
	add	5	6	5	//sp++
	sw	5	1	Stack	// save n to stack
	add	5	6	5	//sp++
	sw	5	2	Stack	// save r to stack
	add	5	6	5	//sp++
	lw	0	6	one
	nor	6	6	6	// negate 6 (gives -1)
	add	6	1	1	// decrement n
	jalr	4	7		// recursive call combination(n-1,r)
	add	6	2	2	// decrement n
	jalr	4	7		// recursive call combination(n-1,r-1)
	lw	5	3	Stack	// load return value
	add	5	6	5	//sp--
	lw	5	4	Stack	// load previous return value
	add	5	6	5	//sp--
	add	3	4	3	// add the two return values
	sw	5	3	Stack	// store return value to stack
	add	5	6	5	//sp++
	lw	5	2	Stack	// load r from stack
	add	5	6	5	//sp--
	lw	5	1	Stack	// load n from stack
	add	5	6	5	//sp--
	lw	5	7	Stack	// load return address from stack
	add	5	6	5	//sp--
	jalr	7	6
base	lw	0	3	one	// return value is 1
	sw	5	3	Stack	// store return value to stack
	add	5	6	5	//sp++
ret	jalr	7	6		// jump back to return address
	halt
n	.fill	7
r	.fill	3
neg1	.fill	-1
one	.fill	1
