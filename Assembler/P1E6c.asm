;El simulador no posee una instrucción para multiplicar números. 
;Escribir un programa para multiplicar los números
;NUM1 y NUM2, y guardar el resultado en la variable RES
;c) Llamando a una subrutina MUL, pasando los parámetros 
;por referencia desde el programa principal a través de
;registros, y devolviendo el resultado a través de un 
;registro por valor.

         org 1000h
         NUM1 dw 8
         NUM2 dw 4
         RES dw ?

         org 3000h
    MUL: mov dx, 0
         mov bx, ax
         mov ax, [bx]
         mov bx, cx
         mov cx, [bx]
         cmp cx, 0
         jz fin
  salto: add dx, ax
         dec cx
         jnz salto
    fin: ret

         org 2000h
         mov ax, offset NUM1
         mov cx, offset NUM2
         call MUL
         mov RES, dx
         hlt
         end