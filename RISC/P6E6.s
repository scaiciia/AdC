.data
	CONTROL: .word32 0x10000 
	DATA: .word32 0x10008

.code
	lwu $s0, DATA($0)
	lwu $s1, CONTROL($0)
	daddi $s2, $0, 8
	sd $s2, 0($s1)
	ld $t0, 0($s0)
	sd $s2, 0($s1)
	ld $t1, 0($s0)
	sd $s2, 0($s1)
	ld $t2, 0($s0)
	sd $s2, 0($s1)
	ld $t4, 0($s0)
	sd $s2, 0($s1)
	ld $t5, 0($s0)
	daddi $s2, $0, 5
	sb $t0, 0($s0)
	sb $t1, 1($s0)
	sb $t2, 2($s0)
	sb $t4, 4($s0)
	sb $t5, 5($s0)
	sd $s2, 0($s1)
	halt