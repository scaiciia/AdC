;Escribir un programa que solicite el ingreso de un número (de un 
;dígito) por teclado y muestre en pantalla dicho número expresado 
;en letras. Luego que solicite el ingreso de otro y así 
;sucesivamente. Se debe finalizar la ejecución al ingresarse en 
;dos vueltas consecutivas el número cero.

                org 1000h
                mensaje db "Digite un numero: "
                cero db "cero  "
                     db "uno   "
                     db "dos   "
                     db "tres  "
                     db "cuatro"
                     db "cinco "
                     db "seis  "
                     db "siete "
                     db "ocho  "
                     db "nueve "
                num db ?
                limpiar db 0ch

                org 2000h
                mov cx, 0
          otro: mov bx, offset limpiar
                mov al, 1
                int 7
                mov bx, offset mensaje
                mov al, offset cero - offset mensaje
                int 7
                mov bx, offset num
                int 6
                cmp num, 30h
                jnz no_cero
                inc cl
                jmp seguir
       no_cero: mov cl, 0
        seguir: mov bx, offset cero
                mov al, 6
          loop: cmp num, 30h
                jz imprime
                add bx, 6
                dec num
                jmp loop
       imprime: int 7
                cmp cl, 2
                jnz otro
                int 0
                end