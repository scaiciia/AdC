;El simulador no posee una instrucción para multiplicar números. 
;Escribir un programa para multiplicar los números
;NUM1 y NUM2, y guardar el resultado en la variable RES
;a) Sin hacer llamados a subrutinas, resolviendo el problema 
;desde el programa principal;

         org 1000h
         NUM1 dw 8
         NUM2 dw 4
         RES dw ?

         org 2000h
         mov ax, NUM1
         mov cx, NUM2
         mov bx, 0
  salto: add bx, ax
         dec cx
         jnz salto
         mov RES, bx
         hlt
         end