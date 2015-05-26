org 100h   

mov al,00h
mov Ah, 00h
INT 10h  

  mov Di, 0300h  
   
  mov Si, 0500h 
  CALL ReadLine 
  CALL Recorrer  
  CALL SUMARD ;Tenemos el numero en Cx  
  CALL ToBinario     ;Tenemos el Numero binario guardado de Si hasta [0500h] 
  std 
SALIDA: 
    lodsb   
    Add Al, 030h 
    CALL PRINT 
    CMP Si,04FFh 
JNZ SALIDA                       
RET                   
 
ToBinario PROC 
    mov Ax,Cx 
Ciclo:     
    mov Dx,00h 
    mov Cx,2d 
    DIV Cx  
    mov [Si],Dl 
    INC Si 
    CMP Ax,1d 
JNZ Ciclo 
    mov [Si],Al 
    RET 
ToBinario ENDP      
Print PROC         ;Printea Al 
    mov Ah,0Eh 
    INT 10h  
    RET 
Print ENDP     
 
ReadLine PROC     
READ: 
    mov Ah, 01h 
TECLA: 
    INT 16h 
JZ TECLA 
    mov Ah,00h 
    INT 16h 
    stosb 
    CMP Al,0Dh 
JNZ READ 
    RET 
ReadLine ENDP 
Recorrer PROC  
    CMP [0301h],0Dh 
JNZ NEXT 
    mov [0304h],0Dh 
    mov Al, [0300h] 
    mov [0303h], Al 
    mov [0302h],30h 
    mov [0301h],30h 
    mov [0300h],30h 
    JMP END  
NEXT: 
    CMP [0302h],0Dh 
JNZ NXT                
    mov [0304h],0Dh 
    mov Al, [0301h] 
    mov [0303h], Al 
    mov Al, [0300h] 
    mov [0302h], Al 
    mov [0301h],30h 
    mov [0300h],30h 
    JMP END 
NXT: 
    CMP [0303h],0Dh 
JNZ END     
    mov [0304h],0Dh    
     
    mov Al, [0302h] 
    mov [0303h], Al 
    mov Al, [0301h] 
    mov [0302h], Al 
    mov Al,[0300h] 
    mov [0301h],Al 
    mov [0300h],30h 
     
END: 
    RET 
Recorrer ENDP     
 
SUMARD PROC 
    SUB [0300h],030h ;x1000 
    SUB [0301h],030h  ;x100 
    SUB [0302h],030h  ; x10 
    SUB [0303h],030h 
     
    mov Ax, 00h 
    mov Al, [0300h] 
    mov Bx,1000d  
    MUL Bx          ;Milesimas en Ax 
    mov Cx, Ax      ;Ahora en Cx     
     
    mov Ax, 00h 
    mov Al,[0301h] 
    mov Bx, 100d 
    MUL Bx        ;Centenas en Ax 
    Add Cx, Ax        ;Sumamos Milesimas y centesimas  
     
    Mov Ax, 00h 
    Mov Al, [0302h] 
    Mov Bx, 10d 
    MUL Bx            ;Decimas en Ax 
    Add Cx, Ax         ;Sumamos Milesimas,centesimas y decenas 
     
    mov Ax,00h 
    mov Al, [0303h] 
    Add Cx,Ax   
    RET 
SUMARD ENDP  