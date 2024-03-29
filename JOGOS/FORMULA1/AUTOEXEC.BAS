010 '*********************************'
020 ' FORMULA 1                       '
030 ' CONVERSAO DO JOGO DO ODISSEY    '
040 ' MANOEL NETO                     '
050 ' 2023-05-20                      '
060 '*********************************'
070 DEFINT A-Z:KEY OFF:SCREEN 1
080 DIM M$(10):DIM CL%(1):DIM IN%(4)
090 DIM YC%(7)
100 GOSUB 1000:'CARREGA FONTE
110 GOSUB 2000:'TELA SELECT GAME
120 COLOR 15,13,13:SCREEN 2,3:CLS 
130 GOSUB 3000:'CARREGA SPRITES
140 ' ESTRUTURA CERCA 
150 XC=75:VC=8
160 YC(0)=0:YC(1)=64:YC(2)=128:YC(3)=191
170 YC(4)=0:YC(5)=64:YC(6)=128:YC(7)=191 
180 ' ESTRUTURA INIMIGO
190 ' 0=>INIMIGO ATIVO:1=>X DO INIMIGO
200 ' 2=>Y DO INIMIGO:3=>VX DO INIMIGO
210 ' 4=>VY DO INIMIGO
220 IN(0)=0:IN(1)=0:IN(2)=0
230 IN(3)=VC:IN(4)=VC
240 ' ESTRUTURA RELOGIO 
250 ' 1=>MINUTOS:2=>SEGUNDOS
260 CL(0)=0:CL(1)=0
270 PT=0 : ' PONTOS 
280 ON SPRITE GOSUB 7000
290 OPEN "GRP:" FOR OUTPUT AS #1

300 ' TELA INICIAL 
310 PUT SPRITE 0,(1,YC(0)),5,1
320 PUT SPRITE 1,(1,YC(1)),5,1
330 PUT SPRITE 2,(1,YC(2)),5,1
340 PUT SPRITE 3,(1,YC(3)),5,1
350 PUT SPRITE 4,(170,YC(4)),5,1
360 PUT SPRITE 5,(170,YC(5)),5,1
370 PUT SPRITE 6,(170,YC(6)),5,1
380 PUT SPRITE 7,(170,YC(7)),5,1
390 PUT SPRITE 8,(XC,160),8,0
400 PRESET(185,50):PRINT #1,PT;
410 GOSUB 5000:' ADICIONA INIMIGO

500 ' GAME LOOP 
510 D=STICK(0)
520 IF D=3 THEN XC=XC+16
530 IF D=7 THEN XC=XC-16
540 IF D=5 THEN VC=VC-4
550 IF D=1 THEN VC=VC+4
560 IF XC<=32 THEN XC=32
570 IF XC>=150 THEN XC=150
580 IF VC<=4 THEN VC=4
590 IF VC>=40 THEN VC=40
600 IF IN(3)<0 THEN IN(3)=VC*-1
610 IF IN(3)>0 THEN IN(3)=VC
620 IN(4)=VC
630 ' MOVE A CERCA 
640 FOR I = 0 TO 7
650   YC(I)=YC(I)-VC
660 NEXT
670  ' UPDATE DO INIMIGO
680 IN(1)=IN(1)+IN(3)
690 IN(2)=IN(2)+IN(4)
700 IF IN(1)<=32  THEN IN(1)=32:IN(3)=IN(3)*-1
710 IF IN(1)>=138 THEN IN(1)=138:IN(3)=IN(3)*-1 
720 ' DESENHA O FRAME
730 SPRITE OFF
740 PUT SPRITE 0,(1,YC(0)),5,1
750 PUT SPRITE 1,(1,YC(1)),5,1
760 PUT SPRITE 2,(1,YC(2)),5,1
770 PUT SPRITE 3,(1,YC(3)),5,1
780 PUT SPRITE 4,(170,YC(4)),5,1
790 PUT SPRITE 5,(170,YC(5)),5,1
800 PUT SPRITE 6,(170,YC(6)),5,1
810 PUT SPRITE 7,(170,YC(7)),5,1
820 PUT SPRITE 8,(XC,160),8,0
830 PUT SPRITE 9,(IN(1),IN(2)),15,0
840 GOSUB 6000
850 SPRITE ON  
920 IF TIME<2 THEN 920
930 TIME=0:PT=PT+VC 
940 GOTO 500:' GAME LOOP 

1000 ' CARREGA A FONTE DO ODYSSEY 
1010 ST=(ASC("A")*8)
1020 FOR I=0 TO 207
1030  READ R$
1040  VPOKE ST+I, VAL("&H"+R$)
1050 NEXT I
1060 RETURN

2000 ' FAZ A SPLASH SECREEN
2010 M$(0)="S":M$(1)="E":M$(2)="L"
2020 M$(3)="E":M$(4)="C":M$(5)="T" 
2030 M$(6)=" ":M$(7)="G":M$(8)="A"
2040 M$(9)="M":M$(10)="E"
2050 MX=7
2060 MY=10
2070 FOR I = 0 TO 10
2080   C=RND(-TIME)*15 
2090   IF C<2 THEN 2080 
2100   COLOR C,1 
2110   LOCATE MX,10 :PRINT M$(I);
2120   MX=MX+1
2130 NEXT I
2140 OP$=INPUT$(1)
2150 RETURN

3000 ' CARREGA SPRITES 
3010 S=BASE(9)
3020 READ R$
3030 IF R$="*" THEN RETURN 
3040 VPOKE S,VAL("&H"+R$)
3050 S=S+1
3060 GOTO 3020

5000 ' ADICIONA OS INIMIGOS 
5010 IF TIME MOD 2 = 0 THEN DR=1 ELSE DR=0
5020 IF DR=1 THEN IN(1)=48 ELSE IN(1)=132
5030 IF DR=1 THEN IN(3)=VC ELSE IN(3)=VC*-1
5040 IN(4)=VC
5050 PUT SPRITE 9,(IN(1),IN(2)),15,0
5060 IN(0)=1
5070 RETURN

6000 ' ATUALIZA HUD
6010 LINE(195,50)-(235,57),13,BF
6020 PRESET(195,50):PRINT #1,PT;
6030 RETURN

7000 ' FIM DO JOGO 
7010 ' TODO - SOM DA EXPLOSAO 
7020 ' TODO - ANIMACAO EXPLOSAO 
7030 OP$=INPUT$(1)
7040 CLOSE #1
7050 GOTO 140

11000 ' FONTE GORDINHA 
11010 DATA 02,06,0E,1E,3E,76,E6,76,FE,CC,D8,FE,CC,D8,F0,E0
11020 DATA 7E,FC,C0,C0,C0,C0,FC,7E,FE,FE,CC,D8,F0,E0,C0,80
11030 DATA FE,FE,00,FE,FE,00,FE,FE,FF,FE,C0,FC,F8,C0,C0,80
11040 DATA 7E,FC,C0,C0,C2,C6,FE,7F,C6,C6,C6,FE,FE,C6,C6,84
11050 DATA 38,38,38,38,38,38,30,20,02,06,06,06,06,06,7E,FE
11060 DATA CE,DC,F8,F0,F8,DC,CE,86,40,C0,C0,C0,C0,C0,FE,FC
11070 DATA 82,C6,EE,FE,FE,D6,C6,C6,C6,E6,F6,FE,DE,CE,C6,42
11080 DATA 7C,FE,C6,C6,C6,C6,FE,7C,FC,FE,06,FE,FC,C0,C0,80
11090 DATA 7C,FE,C6,C6,D6,FE,7C,10,C8,DC,CE,DC,F8,DC,CE,86
11100 DATA FE,FE,80,FE,FE,02,FE,FE,FE,FC,30,30,30,30,30,20
11110 DATA 82,C6,C6,C6,C6,C6,FE,7C,03,06,CC,D8,F0,E0,C0,80
11120 DATA C6,C6,D6,FE,FE,EE,C6,82,86,CE,FC,78,3C,7E,E6,C2
11130 DATA 87,CE,FC,78,30,30,30,20,7E,FE,1C,38,70,E0,FE,FC

12000 ' SPRITES 
12010 ' --- Slot 0 : carrinho
12020 ' color 8
12030 DATA 0F,0F,3F,3F,3F,3F,0F,0F,0C,0C,FF,FF,FF,FF,3F,3F
12040 DATA E0,E0,F8,F8,F8,F8,E0,E0,60,60,FF,FF,FF,FF,FC,FC
12050 ' --- Slot 1 : Cerca
12060 ' color 4
12070 DATA 01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,01
12080 DATA 80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80
12090 DATA *