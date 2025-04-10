0010 ' ===============================
0020 ' GAME LOOP 
0030 ' MANOEL NETO 2024
0040 ' ===============================
0050 COLOR 15,1,1
0060 KEY OFF:CLS:DEFINT A-Z
0070 DIM EX(4,3),EY(4,3)

0100 ' ******************************
0110 ' SPLASH SCREEN
0120 ' ******************************
0130 SCREEN 0
0140 LOCATE 14,10:? "SPACE INVADERS"
0150 LOCATE 10,12:? "PRESS FIRE TO START"
0160 LOCATE 12,14:? "MANOEL NETO 2024"
0170 OP$=INPUT$(1)

0200 ' ******************************
0210 ' INICIALIZA JOGO
0220 ' ******************************
0230 SCREEN 2,2,0
0240 RESTORE 9000 : GOSUB 8000 
0250 ON SPRITE GOSUB 6000 :'COLISOES
0255 ON STRIG GOSUB 5000 :'TORPEDO
0260 STRIG(0) ON
0270 X=127:Y=174:V=16 :'HEROI
0280 TX=0:TY=0:TV=16:TC=0 :'TORPEDO
0290 TIME=0:AN=2:CM=1:VX=1:VY=20
0300 FOR I = 0 TO 4
0310    FOR J = 0 TO 3
0320        EX(I,J)=16+J*20
0330        EY(I,J)=16+I*20
0340   NEXT J
0350 NEXT I

0400 ' ******************************'
0410 ' ATUALIZA AS COORDENADAS       '
0420 ' ******************************'
0425 IF TC = 1 THEN GOSUB 4000:'TORPEDO
0430 FOR I = 0 TO 4
0440    FOR J = 0 TO 3
0450        EX(I,J)=EX(I,J)+VX
0460    NEXT J
0470 NEXT I
0480 IF EX(0,3)>=223 THEN 510 
0490 IF EX(0,0)<=16  THEN 510
0500 GOTO 600 : 'DESENHA O FRAME 
0510 ' INVERTE A DIRECAO DOS ALIENS
0520 VX=VX*-1
0530 FOR I = 0 TO 4
0540    FOR J = 0 TO 3
0550        EY(I,J)=EY(I,J)+VY
0560    NEXT J
0570 NEXT I

0600 ' ******************************'
0610 ' DESENHA O FRAME               '
0620 ' ******************************'
0630 SPRITE OFF
0640   CM=1 : 'camada dos sprites
0650   PUT SPRITE 0,(X,Y),6,0 : 'CANHAO
0655   IF TC=1 THEN PUT SPRITE 21,(TX,TY),8,3 : 'TORPEDO
0660   FOR I = 0 TO 4 : 'ALIENS
0670     FOR J = 0 TO 3
0680       PUT SPRITE CM,(EX(I,J),EY(I,J)),3,AN
0690       CM=CM+1
0700     NEXT J
0710   NEXT I
0730 SPRITE ON
0740 IF TIME<2 GOTO 740
0750 IF AN=1 THEN AN=2 ELSE AN=1
0760 TIME=0 

0800 ' ******************************'
0810 ' ENTRADA DO JOGADOR            '
0820 ' ******************************'
0830 S=STICK(0) 
0840 IF S = 3 THEN GOTO 870
0850 IF S = 7 THEN GOTO 880
0860 GOTO 920
0870 X=X+V:GOTO 920
0880 X=X-V:GOTO 920
0890 ' ******************************'
0900 ' DETERMINA OS LIMITES DA TELA  '
0910 ' ******************************'
0920 IF X<0 THEN X=0
0930 IF X>239 THEN X=239
0940 GOTO 400

4000 ' ******************************'
4010 ' TRATA TORPEDO                 '
4020 ' ******************************'
4030 TY = TY - TV
4040 IF TY <= 0 THEN TY = -20:TC=0
4999 RETURN

5000 ' ******************************'
5010 ' ADICIONA UM TORPEDO           '
5020 ' ******************************'
5030 IF TC = 1 THEN RETURN
5040 TC=1:TX=X:TY=Y-10
5050 RETURN

6000 ' ******************************'
6010 ' TRATA AS COLISOES             '
6020 ' ******************************'
6030 SPRITE OFF
6040 COLOR 15,1,1
6050 SCREEN 0
6060 CLS
6070 GOTO 7000
6080 END

7000 ' ******************************
7010 ' FIM DO JOGO 
7020 ' ******************************
7030 PRINT "DESEJA JOGAR NOVAMENTE? (S/N)"
7040 OP$=INPUT$(1)
7050 IF OP$="S" OR OP$="s" THEN 200
7060 END

8000 ' ******************************'
8010 ' CARREGA DIRETO NO VDP         '
8020 ' ******************************'
8030 S=BASE(9)
8040 READ R$
8050 IF R$="*" THEN RETURN ELSE VPOKE S,VAL("&H"+R$):S=S+1
8060 GOTO 8040

9000 ' ******************************'
9010 ' PADRAO DOS SPRITES            '
9020 ' ******************************'
9030 ' CANHAO - COLOR 6
9040 DATA 00,00,00,00,00,00,01,01
9050 DATA 07,07,07,7F,FF,FF,FF,FF
9060 DATA 00,00,00,00,00,00,80,80
9070 DATA E0,E0,E0,FE,FF,FF,FF,FF
9130 ' ALIEN 1-1 - COLOR 3
9140 DATA 00,01,07,1F,13,3F,7F,7E
9150 DATA 1C,18,20,30,18,0C,06,02
9160 DATA 00,80,E0,F8,C8,FC,FE,7E
9170 DATA 38,18,04,0C,18,30,60,40
9180 ' ALIEN 1-2 - COLOR 3
9190 DATA 00,01,07,1F,13,3F,7F,7F
9200 DATA 1F,03,06,0C,18,30,60,40
9210 DATA 00,80,E0,F8,C8,FC,FE,FE
9220 DATA F8,C0,60,30,18,0C,06,02
9230 ' TORPEDO - COLOR 8
9240 DATA 00,00,00,00,00,00,00,00
9250 DATA 00,01,01,01,01,01,01,01
9260 DATA 00,00,00,00,00,00,00,00
9270 DATA 00,80,80,80,80,80,80,80
9999 DATA *