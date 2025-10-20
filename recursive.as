combo	beq	0	1	base
one	beq	1	2	base
	jalr	7	6
		
base	lw	0	4	one
ret	jalr	7	6
