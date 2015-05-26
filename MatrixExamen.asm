PrintRow MACRO inicio, fin, row, color , column 
Local Start 
    MOV SI, inicio 
    MOV DH, row                  
    MOV DL, column 
    mov BL, color 
    MOV CX, 01h 
Start: 
    INC DL 
    MOV AH, 02H 
    INT 10H 
    MOV AH, 09H  
    std 
    LODSB 
    MOV AH, 09H 
    INT 10H 
    CMP SI, fin 
JNZ Start 
PrintRow ENDM 
PrintArray MACRO Array, LastPosition  
LOCAL AB     
    mov Si, 00h 
AB:     
    Mov Al, Array[si] 
    mov Ah, 0Eh 
    INT 10h    
    INC Si 
    CMP Al, LastPosition  
JNZ AB     
PrintArray ENDM 
org 100H 
JMP Inicio 
GetNums DB '16 numeros para la matrix separados por espacios', 0   
Inicio:       
MOV AH, 00H   
MOV AL, 03H              
INT 10H       
MOV DI, 1200H 
MOV BL, 01FH 
              
PrintArray GetNums, 0 
Call Readline 
Call Imprimir1 
Call Wait 
Call Imprimir2 
Call Wait 
Call Imprimir3 
Call Wait 
Call Imprimir4 
RET 
ReadLine PROC       
READ: 
    mov ah,01h          
TECLA: 
    INT 16h             
JZ TECLA  
    mov ah,00h          
    INT 16h  
    stosb       
    CMP Al, 0Dh 
JNZ READ 
    RET 
ReadLine ENDP 
Wait PROC 
    MOV AH, 86H     
    MOV DX,  cf2  cb3 8D80H cf0  cb1     MOV CX, 05Bh 
    INT 15H 
    RET 
Wait ENDP 
Imprimir1 PROC 
    PrintRow 121EH, 1217H, 01H, 05H ,01h 
    PrintRow 1216H, 120FH, 02H, 05H ,01h 
    PrintRow 120EH, 1207H, 03H, 05H ,01h 
    PrintRow 1206H, 11FFH, 04H, 05H ,01h 
    RET     
Imprimir1 ENDP 
Imprimir2 PROC                            
    PrintRow 121EH, 1217H, 01H, 02H ,0Ah 
    PrintRow 1216H, 120FH, 02H, 02H ,0Ah 
    PrintRow 120EH, 1207H, 03H, 02H ,0Ah 
    PrintRow 1206H, 11FFH, 04H, 02H ,0Ah 
    RET 
Imprimir2 ENDP 
Imprimir3 PROC                            
    PrintRow 121EH, 1217H, 01H, 04H ,18d 
    PrintRow 1216H, 120FH, 02H, 04H ,18d 
    PrintRow 120EH, 1207H, 03H, 04H ,18d 
    PrintRow 1206H, 11FFH, 04H, 04H ,18d    
    RET 
Imprimir3 ENDP 
Imprimir4 PROC                          
    PrintRow 121EH, 1217H, 08H, 03H ,01h 
    PrintRow 1216H, 120FH, 09H, 03H ,01h 
    PrintRow 120EH, 1207H, 0AH, 03H ,01h 
    PrintRow 1206H, 11FFH, 0BH, 03H ,01h 
    RET 
Imprimir4 ENDP}