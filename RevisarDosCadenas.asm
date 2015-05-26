PrintArray MACRO Array, LastPosition    ;Imprime como va el Vector 
LOCAL AB     
    mov Di, 00h 
AB:     
    Mov Al, Array[Di] 
    mov Ah, 0Eh 
    INT 10h    
    INC Di 
    CMP Al, LastPosition  
JNZ AB     
PrintArray ENDM  
org 100h  
JMP INICIO    
MSGUNO DB '1)',0 
MSGDOS DB '2)',0 
DIFERENTES DB 'Son diferentes',0 
IGUALES DB 'Son Iguales',0  
INICIO: 
    PrintArray MSGUNO, 0  
mov Di, 200h 
    CALL ReadLine  
mov Bp, Di ;La cadena va de [200h] a Bp            
    mov Al, 0Ah 
    CALL Print 
    PrintArray MSGDOS,0  
mov Di, 500h 
    CALL ReadLine ;Cadena va de [500h] a Di  
    CALL CompararLength 
mov Sp, 0200h 
mov Si, 0500h       
Chequeo: 
    lodsb  
    mov Bl, Al ;Primer Char en Bl [0500h] 
    mov Bp, Si ;Bp tiene el conteo de cadena 2  [0501] 
    mov Si, Sp  
    lodsb 
    CMP Al,Bl 
JZ CT   
    CALL Dif 
CT:    
    mov Sp, Si ;Sp tiene Conteo de cadena 1 [201] 
    mov Si, Bp ;Si tiene de nuevo conteo de cadena 2 
    CMP Si, Di ;De 500 hasta Di 
JNZ Chequeo  
    PrintArray IGUALES,0   
  ;Comparar [200+i] con [500+i]    
FINDEPROGRAMA: 
RET 
CompararLength PROC  
    SUB Bp, 200h 
    SUB Di, 500h    
    CMP Bp, Di 
JZ CONT 
    CALL Dif 
CONT:  
    ADD Bp, 200h 
    ADD Di, 500h 
    RET 
CompararLength ENDP 
ReadLine PROC     
ENTRADA: 
    mov Ah,01 
AB:           
    INT 16H       
JZ AB                 
    stosb  
    CALL PRINT             
    mov Ah,00 
    INT 16h       ;Limpiar Buffer  
    CMP AL, 0Dh   ;Compara lo que metio el usuario, si es Enter ZF = 1 
JNZ ENTRADA  
    RET 
ReadLine ENDP   
Print PROC           ;Imprime Al 
    mov Ah,0Eh 
    INT 10h      
    RET  
Print ENDP 
Dif PROC   
    mov Al, 0Ah 
    CALL Print 
    PrintArray DIFERENTES,0 
    JMP FINDEPROGRAMA 
    RET 
Dif ENDP  