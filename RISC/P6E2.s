.data
	CONTROL: .word32 0x10000
	DATA: .word32 0x10008
	cero: .asciiz "CERO  "
	uno: .asciiz "UNO   "
	dos: .asciiz "DOS   "
	tres: .asciiz "TRES  "
	cuatro: .asciiz "CUATRO"
	cinco: .asciiz "CINCO "
	seis: .asciiz "SEIS  "
	siete: .asciiz "SIETE "
	ocho: .asciiz "OCHO  "
	nueve: .asciiz "NUEVE "

.code
	lwu $s0, DATA($0)
	lwu $s1, CONTROL($0)
	jal ingreso
	dadd $a0, $v0, $0
	jal muestra
	halt

ingreso: daddi $t0, $0, 8
loop:	sd $t0, 0($s1)
	ld $t1, 0($s0)
	slti $t2, $t1, 10
	beqz $t2, loop
	dadd $v0, $t1, $0
	jr $ra

muestra: daddi $t0, $0, 8
	dmul $t1, $t0, $a0
	daddi $t2, $t1, cero
	sd $t2, 0($s0)
	daddi $t2, $0, 6
	sd $t2, 0($s1)
	daddi $t2, $0, 4
	sd $t2, 0($s1)
	jr $ra