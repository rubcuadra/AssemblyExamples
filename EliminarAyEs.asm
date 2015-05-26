{\rtf1\ansi\ansicpg1252\cocoartf1265\cocoasubrtf210
{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural

\f0\fs24 \cf0 org 100h    \
mov Di, 200h\
    CALL ReadLine      \
mov Si,200h ;Aqui empieza la cadena\
  \
SALIDA:      \
    lodsb   \
    CALL EsAoE  \
    CALL Print\
    CMP Si,Di\
JNZ SALIDA \
RET\
\
ReadLine PROC    ;Guarda lo que escribe el usuario a partir de donde esta Di\
ENTRADA:\
    mov Ah,01\
AB:          \
    INT 16H       ;Guarda el Char en Al\
JZ AB             ;Correra mientras el usuario no presione tecla\
    stosb             \
    mov Ah,00\
    INT 16h       ;Limpiar Buffer \
    CMP AL, 0Dh   ;Compara lo que metio el usuario, si es Enter ZF = 1\
JNZ ENTRADA \
    RET\
ReadLine ENDP  \
\
Print PROC           ;Imprime Al\
    mov Ah,0Eh\
    INT 10h     \
    RET \
Print ENDP    \
\
EsAoE PROC\
\
AGAIN:     \
    CMP Al, 'a' \
JZ SiEs    \
    CMP Al,'e'\
JZ SiEs     \
JMP FIN  \
            SiEs: \
                lodsb\
                JMP AGAIN   \
FIN:       \
    RET\
EsAoE ENDP}