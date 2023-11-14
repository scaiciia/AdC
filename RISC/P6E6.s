.data
	CONTROL: .word32 0x10000 
	DATA: .word32 0x10008

.code
	lwu $s0, DATA($0)
	lwu $s1, CONTROL($0)
	
	halt