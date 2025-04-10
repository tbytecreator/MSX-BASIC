00010 ' ===================================
00020 ' CALCULO DAS COORDENADAS SCR2 
00030 ' ===================================
00040 CLS:SCREEN 2
00050 X=100:Y=10:TP=BASE(12):AN=0
00060 CO=(Y\8)*256+(Y AND 7)+(X AND &HF8)
00070 CP=TP+CO
00100 RESTORE 1000

00200 ' ===================================
00210 ' CARGA DA TABELA DE PADROES 
00220 ' ===================================
00230 ' 6 KB of VRAM from 0000H to 17FFH
00240 ' ===================================
00250 FOR I =0 TO 2
00260   FOR J=0 TO 254
00270     READ M$
00280     M=VAL("&H"+M$)
00290     VPOKE I*256+J, M
00300   NEXT J
00310   RESTORE 1000
00320 NEXT I

00400 ' ===================================
00410 ' CARGA DA TABELA DE CORES    
00420 ' ===================================
00430 ' 6 KB of VRAM from 2000H to 37FFH
00440 ' ===================================
00450 FOR I =0 TO &H17FF
00460   VPOKE &H2000+I,32
00470 NEXT I

00600 ' ===================================
00610 ' CARGA DA TABELA DE NOMES
00620 ' ===================================
00630 ' 768 bytes from 1800H to 1AFFH
00640 ' initialized with the character code 
00650 ' sequence 0 to 255 repeated three 
00660 ' times and is then left untouched
00670 ' in this mode it is the Character 
00680 ' Pattern Table which is modified 
00690 ' during normal operation.
00700 ' ===================================
00710 FOR I=&H1800 TO &H1AFF
00720   VPOKE I, 0
00730 NEXT I

00800 ' ===================================
00810 ' LOOP PRINCIPAL
00820 ' ===================================
00830 IF AN=1 THEN AN=0 ELSE AN=1  
00840 FOR I=0 TO 7
00850   VPOKE 8+I, VPEEK(CO+I)
00860   POKE &H2000+8+I, VPEEK(&H2000+CO+I)
00870 NEXT I
00880 IF TIME<20 THEN 880 ELSE TIME=0
00890 A$=INKEY$:IF A$="" THEN 830
00900 RUN"AUTOEXEC.BAS"

01000 ' ===================================
01010 ' DATA 
01020 ' ===================================
01030 DATA 18,3C,7E,DB,FF,24,5A,A5
01040 DATA 18,3C,7E,DB,FF,5A,81,42
01050 DATA 00,00,00,00,00,00,00,00
01060 DATA 00,00,00,00,00,00,00,00
01070 DATA 00,00,00,00,00,00,00,00
01080 DATA 00,00,00,00,00,00,00,00
01090 DATA 00,00,00,00,00,00,00,00
01100 DATA 00,00,00,00,00,00,00,00
01110 DATA 00,00,00,00,00,00,00,00
01120 DATA 00,00,00,00,00,00,00,00
01130 DATA 00,00,00,00,00,00,00,00
01140 DATA 00,00,00,00,00,00,00,00
01150 DATA 00,00,00,00,00,00,00,00
01160 DATA 00,00,00,00,00,00,00,00
01170 DATA 00,00,00,00,00,00,00,00
01180 DATA 00,00,00,00,00,00,00,00
01190 DATA 00,00,00,00,00,00,00,00
01200 DATA 00,00,00,00,00,00,00,00
01210 DATA 00,00,00,00,00,00,00,00
01220 DATA 00,00,00,00,00,00,00,00
01230 DATA 00,00,00,00,00,00,00,00
01240 DATA 00,00,00,00,00,00,00,00
01250 DATA 00,00,00,00,00,00,00,00
01260 DATA 00,00,00,00,00,00,00,00
01270 DATA 00,00,00,00,00,00,00,00
01280 DATA 00,00,00,00,00,00,00,00
01290 DATA 00,00,00,00,00,00,00,00
01300 DATA 00,00,00,00,00,00,00,00
01310 DATA 00,00,00,00,00,00,00,00
01320 DATA 00,00,00,00,00,00,00,00
01330 DATA 00,00,00,00,00,00,00,00
01340 DATA 00,00,00,00,00,00,00,00