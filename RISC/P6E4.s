.data
	CONTROL: .word32 0x10000
	DATA: .word32 0x10008
	denegado: .asciiz "ERROR"
	concedido: .asciiz "Bienvenido"
	clave: .ascii "Hola"
	
.code
	lwu $s0, DATA($0)
	lwu $s1, CONTROL($0)
	jal char
	daddi $a0, $v0, denegado
	jal respuesta
	halt

	char:  	dadd $v0, $0, $0
		dadd $t0, $0, $0
		daddi $t1, $0, 4
		daddi $t2, $0, 9
	sigue:	lbu $t4, clave($t0)
		sd $t2, 0($s1)
	       	ld $t3, 0($s0)
		bne $t3, $t4, fin
		daddi $t0, $t0, 1
		bne $t0, $t1, sigue
		daddi $v0, $0, 8
	fin:	jr $ra

   respuesta:	daddi $t0, $0, 4
		sd $a0, 0($s0)
		sd $t0, 0($s1)
		jr $ra