0010 ' ===============================
0020 ' SPRITES COLORIDOS 
0030 ' MANOEL NETO 2014 
0040 ' ===============================
0050 COLOR 15,1,1
0060 SCREEN 2,2,0
0070 KEY OFF
0080 CLS
0090 GOSUB 1000 : ' CARREGA SPRITES
0100 ON SPRITE GOSUB 800 : ' COLISOES

0200 ' ******************************'
0210 ' PROPRIEDADES OBJETOS DE TELA  '
0220 ' ******************************'
0230 X=127:Y=174

0300 ' ******************************'
0310 ' ENTRADA DO JOGADOR            '
0320 ' ******************************'
0330 ON STICK(TE) GOTO 350,360,370,380,390,400,410,420
0340 GOTO 500
0350 Y=Y-2:GOTO 500
0360 Y=Y-2:X=X+2:GOTO 500
0370 X=X+2:GOTO 500
0380 Y=Y+2:X=X+2:GOTO 500
0390 Y=Y+2:GOTO 500
0400 Y=Y+2:X=X-2:GOTO 500 
0410 X=X-2:GOTO 500
0420 Y=Y-2:X=X-2:GOTO 500

0500 ' ******************************'
0510 ' DETERMINA OS LIMITES DA TELA  '
0520 ' ******************************'
0530 IF X<0 THEN X=0
0540 IF X>239 THEN X=239
0550 IF Y<0 THEN Y=0
0560 IF Y>174 THEN Y=174
0570 ' ******************************'
0580 ' DESENHA OS SPRITES            '
0590 ' ******************************'
0600 ' SPRITE OFF
0610   PUT SPRITE 0,(X,Y),1,0
0620   PUT SPRITE 1,(X,Y),10,1
0630 ' SPRITE ON
0640 IF TIME<2 GOTO 630 ELSE TIME=0
0650 GOTO 300

0800 ' ******************************'
0810 ' TRATA AS COLISOES             '
0820 ' ******************************'
0830 COLOR 15,1,1
0840 SCREEN 0
0850 CLS
0860 ?"COLIDIU"
0870 END

1000 ' ******************************'
1010 ' CARREGA DIRETO NO VDP         '
1020 ' ******************************'
1030 S=BASE(9)
1040 READ R$
1050 IF R$="*" THEN RETURN ELSE VPOKE S,VAL("&H"+R$):S=S+1
1060 GOTO 1040

9000 ' ******************************'
9010 ' PADRAO DOS SPRITES            '
9020 ' ******************************'
9030 DATA 01,03,06,0C,18,31,21,63
9040 DATA 47,C7,81,98,B8,F8,30,3F
9050 DATA 80,C0,60,30,18,8C,84,C6
9060 DATA E2,E3,81,19,1D,1F,0C,FC
9070 ' color 10
9080 DATA 00,00,01,03,07,0E,1E,1C
9090 DATA 38,38,7E,67,47,07,0F,00
9100 DATA 00,00,80,C0,E0,70,78,38
9110 DATA 1C,1C,7E,E6,E2,E0,F0,00
9120 DATA *