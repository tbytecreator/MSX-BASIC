0010 ' ===============================
0020 ' SPRITES COLORIDOS 
0030 ' MANOEL NETO 2014 
0040 ' ===============================
0050 COLOR 15,1,1
0060 SCREEN 2,2,0
0070 KEY OFF
0080 CLS:DEFINT A-Z
0090 GOSUB 1000 : ' CARREGA SPRITES
0100 ON SPRITE GOSUB 800 : ' COLISOES

0200 ' ******************************'
0210 ' PROPRIEDADES OBJETOS DE TELA  '
0220 ' ******************************'
0230 X=127:Y=174:TIME=0

0300 ' ******************************'
0310 ' ENTRADA DO JOGADOR            '
0320 ' ******************************'
0330 ON STICK(TE) GOTO 350,360,370,380,390,400,410,420
0340 GOTO 460
0350 Y=Y-2:GOTO 460
0360 Y=Y-2:X=X+2:GOTO 460
0370 X=X+2:GOTO 460
0380 Y=Y+2:X=X+2:GOTO 460
0390 Y=Y+2:GOTO 460
0400 Y=Y+2:X=X-2:GOTO 460 
0410 X=X-2:GOTO 460
0420 Y=Y-2:X=X-2:GOTO 460
0430 ' ******************************'
0440 ' DETERMINA OS LIMITES DA TELA  '
0450 ' ******************************'
0460 IF X<0 THEN X=0
0470 IF X>250 THEN X=250
0480 IF Y<0 THEN Y=0
0490 IF Y>190 THEN Y=190

0600 ' ******************************'
0610 ' DESENHA OS SPRITES            '
0620 ' ******************************'
0630 IF TIME<1 GOTO 630
0640 SPRITE OFF
0650   PUT SPRITE 0,(X,Y),2,0
0660   PUT SPRITE 1,(X,Y),8,1
0670 SPRITE ON
0680 IF TIME<2 GOTO 680
0690 TIME=0 
0700 GOTO 330

0800 ' ******************************'
0810 ' TRATA AS COLISOES             '
0820 ' ******************************'
0830 SPRITE OFF
0840 COLOR 15,1,1
0850 SCREEN 0
0860 CLS
0870 ?"COLIDIU"
0880 END

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
9030 ' color 2
9040 DATA 00,00,00,00,00,00,00,00,01,03,07,0F,1E,3C,78,FF
9050 DATA 00,00,00,00,00,00,00,00,80,C0,E0,F0,78,3C,1E,FF
9060 ' color 8
9070 DATA 00,00,00,00,00,00,00,00,00,00,00,00,01,03,07,00
9080 DATA 00,00,00,00,00,00,00,00,00,00,00,00,80,C0,E0,00
9090 DATA *