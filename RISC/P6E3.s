.data
	CONTROL: .word32 0x10000
	DATA: .word32 0x10008

.code
	lwu $s0, DATA($0)
	lwu $s1, CONTROL($0)
	dadd $a0, $0, $0
	daddi $t0, $0, 2
	loop: jal ingreso
	dadd $a0, $a0, $v0
	daddi $t0, $t0, -1
	bnez $t0, loop
	jal resultado
	halt

ingreso: daddi $t1, $0, 8
	otro: sd $t1, 0($s1)
	ld $t2, 0($s0)
	slti $t3, $t2, 10
	beqz $t3, otro
	dadd $v0, $t2, $0
	jr $ra

resultado: sd $a0, 0($s0)
	  daddi $t1, $0, 6
	  sd $t1, 0($s1)
	  daddi $t1, $0, 1
	  sd $t1, 0($s1)
	  jr $ra
