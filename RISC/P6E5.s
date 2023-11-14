.data
	CONTROL: .word32 0x10000
	DATA: .word32 0x10008

.code
	lwu $s0, DATA($0)
	lwu $s1, CONTROL($0)
	daddi $t0, $0, 8
	sd $t0, 0($s1)
	l.d f0, 0($s0)
	sd $t0, 0($s1)
	ld $a0, 0($s0)
	jal a_la_potencia
	halt

	a_la_potencia:	daddi $t0, $0, 1
			dadd $t1, $0, $a0
			mtc1 $t0, f1
			cvt.d.l f1, f1
			beqz $t1, fin
			daddi $t1, $t1, -1
			mtc1 $0, f2
			cvt.d.l f2, f2
			add.d f1, f2, f0
			beqz $t1, fin
		loop: 	daddi $t1, $t1, -1
			mul.d f1, f1, f0
			bnez $t1, loop
		fin:	jr $ra