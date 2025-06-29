00010 ' ====================================
00020 ' ALIEMINATION
00030 ' MANOEL NETO 2025
00040 ' ====================================
00050 COLOR 15,1,1
00060 KEY OFF:CLS:DEFINT A-Z
00070 DIM EX(5,11),EY(5,11)
00080 DEFUSR1=&H41 : ' FUNCAO DESLIGA TELA
00090 DEFUSR2=&H44 : ' FUNCAO LIGA TELA

00100 ' ************************************
00110 ' SPLASH SCREEN
00120 ' ************************************
00130 SCREEN 1
00140 LOCATE 6,8:? "SPACE INVADERS"
00150 LOCATE 4,9:? "PRESS FIRE TO START"
00160 LOCATE 6,10:? "MANOEL NETO 2024"
00170 OP$=INPUT$(1)
00180 CLS

00200 ' ************************************
00210 ' INICIALIZA JOGO
00220 ' ************************************
00230 AL=1: ' ANIMACAO DOS ALIENS
00240 CA=2: ' COLUNA DOS ALIENS 
00250 LA=1: ' LINHA DOS ALIENS 
00260 DR=1: ' DIRECAO DOS ALIENS 
00270 CC=0: ' CONTADOR DE COLUNAS
00280 RESTORE 9000
00290 GOSUB 6000 : ' TABELA DE PADROES
00300 GOSUB 7000 : ' TABELA DE CORES
00310 ' CARREGA A POSICAO DOS ALIENS
00320 FOR I = 0 TO 4
00330    FOR J = 0 TO 10
00340        EX(I,J)=(J+1)*CA
00350        EY(I,J)=LA+I
00360    NEXT J
00370 NEXT I

00400 ' ***********************************
00410 ' GAME LOOP  
00420 ' ***********************************
00430 ' VERIFICA A DIRECAO DOS ALIENS
00440 IF CC=7 THEN DR=-1:LA=LA+1
00450 IF CC=0 THEN DR=1:LA=LA+1
00460 ' VERIICA O FIM DO JOGO
00470 IF LA >= 20 THEN GOTO 5000
00480 ' DESLIGA A TELA PARA DRAW
00490 A=USR1(0)
00500 ' METODO DRAW
00510 FOR I = 0 TO 4
00520    FOR J = 0 TO 10
00530       CL=EX(I,J):LN=EY(I,J)
00540       VPOKE &H1800+CL+LN*32,0
00550       CL=CL+DR
00560       LN=LA+I
00570       VPOKE &H1800+CL+LN*32,AL
00580       EX(I,J)=CL
00590       EY(I,J)=LN
00600    NEXT J
00610 NEXT I
00620 ' RELIGA A TELA 
00630 A=USR2(1)
00640 IF AL=2 THEN AL=1 ELSE AL=2 
00650 CC=CC+DR : ' CONTADOR DE COLUNAS
00660 TIME = 0 
00670 IF TIME<60 THEN GOTO 670 ELSE TIME=TIME+1
00680 GOTO 400

05000 ' ************************************
05010 ' FIM DO JOGO
05020 ' ************************************
05030 CLS
05040 LOCATE 6,8:? "GAME OVER"
05050 LOCATE 4,9:? "PRESS FIRE TO PLAY AGAIN"
05060 OP$=INPUT$(1)
05070 GOTO 100

06000 ' ************************************
06010 ' CARREGA A TABELA DE PADROES 
06020 ' ************************************
06030 S=0 
06040 READ R$
06050 IF R$="*" THEN RETURN 
06060 R=VAL("&H"+R$)
06070 VPOKE S,R
06080 S=S+1
06090 GOTO 6040

07000 ' ************************************
07010 ' CARREGA A TABELA DE CORES  
07020 ' ************************************
07030 FOR I=0 TO 31
07040   VPOKE &H2000+I,32
07050 NEXT I
07060 RETURN 

09000 ' ************************************
09010 ' SPRITES           
09020 ' ************************************
09030 ' ALIENS - COLOR 7
09040 DATA 00,00,00,00,00,00,00,00
09050 DATA 18,3C,7E,DB,FF,24,5A,A5
09060 DATA 18,3C,7E,DB,FF,5A,81,42
09070 DATA *