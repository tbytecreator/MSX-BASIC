01 ' ================================
02 ' CIRCLE.BAS 
03 ' TRACA CIRCUNFERENCIAS, ELIPSES 
04 ' OU ARCOS 
05 ' (X,Y) COORDENADAS DO CENTRO
06 ' R  -=> RAIO,C -=>COR
07 ' AI -=> ANGULO INICIAL (RADIANOS)
08 ' AF -=> ANGULO FINAL   (RADIANOS)
09 ' A  -=> RELACAO ENTRE OS EIXOS 
10 ' ================================
20 DEFINT A-Z:SCREEN 2:COLOR 15,1,1
30 OPEN "GRP:" AS #1
40 PI!=4*ATN(1)

100 ' ================================
110 ' CIRCUNFERENCIA SIMPLES
120 ' ================================
130 PRESET(10,10):PRINT #1,"PI:"
140 PRESET(20,10):PRINT #1,PI!
150 Y=80:R=40:C=8
160 FOR X = 10 TO 255 STEP 5 
170   CIRCLE (X,Y),R,C
180 NEXT X 
190 OP$=INPUT$(1)

200 ' ================================
210 ' DESENHANDO ARCOS 
220 ' ESPECIFICAMOS O ARCO INICIAL E
230 ' O ARCO FINAL EM RADIANOS
240 ' ================================
250 CLS
260 X=128:Y=90:R=70:C=7:AI!=PI!/2
270 AF!=3*PI!/2
280 CIRCLE (X,Y),R,C,AI!,AF!
290 PRESET(10,10)
290 OP$=INPUT$(1)

300 ' ================================
310 ' SETORES CIRCULARES  
320 ' INVERTEMOS O SINAL DOS ARCOS 
330 ' INICIAL E FINAL
340 ' ================================
350 CLS
360 X=128:Y=90:R=70:C=7:AI!=(PI!/2)*-1
370 AF!=(3*PI!/2)*-1
380 CIRCLE (X,Y),R,C,AI!,AF!
390 OP$=INPUT$(1)

400 ' ================================
410 ' ACHATAMENTO  
420 ' ALTERAMOS A RELACAO DOS EIXOS 
430 ' X E Y 
440 ' ================================
450 CLS
460 X=128:Y=90:R=70:C=7
470 A!=2.75
480 CIRCLE (X,Y),R,C,,,A!
490 OP$=INPUT$(1)

500 ' ================================
510 ' PINTURA DE UMA REGIAO  
520 ' COMANDO PAINT (X,Y),C 
530 ' (X,Y)-=>COORDENADAS;C-=>COR
540 ' ================================
550 CLS
560 LINE(1,1)-(255,191),15,BF
570 X=128:Y=90:R=50:C=8:A!=1.25
580 CIRCLE (X,Y),R,C,,,A! 
590 PAINT (X,Y),C
600 OP$=INPUT$(1)

999 RUN"AUTOEXEC.BAS 