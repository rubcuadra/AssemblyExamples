{\rtf1\ansi\ansicpg1252\cocoartf1265\cocoasubrtf210
{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural

\f0\fs24 \cf0 org 100h\
JMP INICIO\
CUBO DB '816157492',' '\
INICIO:\
mov Di, 0300h  \
mov Si, 0300h   \
\
CALL READLINE   ;Guarda el mensaje de 300 a Di\
mov Cx, Di\
mov Di, 00\
Encr:\
    mov Ax,00\
    lodsb\
    Add Al, CUBO[Di] \
    INC Di\
    SUB Ax, 030h \
    CALL Print \
    CMP Di, 09h\
JZ CERO\
Seguimos:     \
    CMP Si, Cx \
JNZ Encr\
    JMP FIN\
\
CERO:\
    mov Di, 00h\
    mov Al,' '\
    CALL PRINT\
    JMP Seguimos  \
\
FIN:\
RET\
  \
\
Print PROC\
   mov Ah,0Eh\
   INT 10h\
   RET\
Print ENDP    \
\
     \
ReadLine PROC    \
READ:\
    mov Ah, 01h\
TECLA:\
    INT 16h\
JZ TECLA\
    mov Ah,00h\
    INT 16h\
    stosb\
    CMP Al,0Dh\
JNZ READ\
    RET\
ReadLine ENDP}