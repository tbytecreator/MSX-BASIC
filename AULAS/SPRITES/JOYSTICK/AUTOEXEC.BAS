0010 DEFINT A-Z:SCREEN 0:WIDTH 40
0020 KEY OFF:CLS:COLOR 15,1,1
0030 ?"==========================="
0040 ?"MOVIMENTO DOS SPRITES      "
0050 ?"==========================="
0060 ?"(0)CURSOR                  "
0070 ?"(1)JOYSTICK 1              "
0080 ?"(2)JOYSTICK 2              "
0090 ?"(E)ND                      "
0100 ?"==========================="
0110 ?">";:OP$=INPUT$(1)
0120 IF OP$="0" THEN TE=0
0130 IF OP$="1" THEN TE=1
0140 IF OP$="2" THEN TE=2
0150 IF OP$="E" OR OP$="e" THEN END
0160 SCREEN 2,2,0
0170 GOSUB 1000:'CARREGA OS SPRITES

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
0600 SPRITE OFF
0610   PUT SPRITE 0,(X,Y),4,0
0620 SPRITE ON
0630 IF TIME<2 GOTO 630 ELSE TIME=0
0640 GOTO 300

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
9030 DATA 00,00,00,00,00,00,01,01
9040 DATA 07,07,07,7F,FF,FF,FF,FF
9050 DATA 00,00,00,00,00,00,80,80
9060 DATA E0,E0,E0,FE,FF,FF,FF,FF
9070 DATA *