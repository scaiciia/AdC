.data
A: .word 2
B: .word 3
C: .word 4

.code
dadd r1, r0, r0
ld r2, A(r0)
ld r3, B(r0)
ld r4, C(r0)
beq r2, r3, igualesAB
compararAC: beq r2, 
