
 ;Imprime lo que este en Al\
       mov Ah, 02h
       Mov Dl, row
       Mov Dh, column
       INT 10h ;Apunta a rows y columns\
       
       mov Ah,09
       INT 10h ;Imprimir donde esta apuntando\
Print endm
org 100h   
mov Bh, 00h
mov Bl,0Fh
mov Cx, 02h
Mov [0300h], 00h
mov [0301h], 04h

mov Ah, 00h
mov Al, 03h
INT 10h         ;Saca Pantalla\
 
mov Al,'*' 
mov Cx,0Ah 
HORIZONTAL:
    Print [0300h], [0301h]
    INC [0301h]
    Print [0300h], [0301h] 
    DEC [0301h]
    ADD [0300h],10d
    CMP [0300h],80d 
JNZ HORIZONTAL
    mov [0300h],0h
    Add [0301h],6d
    CMP [0301h],28d  
JNZ HORIZONTAL    
    mov [0300h],00h
    mov [0301h],04h      
    mov Cx, 02h  
VERTICAL: 
    Print [0301h],[0300h] ;(1,X) \
    INC [0300h]
    CMP [0300h], 019h 
JNZ VERTICAL 
    Add [0301h],6d
    mov [0300h],00h
    CMP [0301h],82d
JNZ VERTICAL          
RET