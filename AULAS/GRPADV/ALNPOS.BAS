00010 ' ====================================
00020 ' ALIEMINATION
00030 ' MANOEL NETO 2025
00040 ' ====================================
00050 COLOR 15,1,1
00060 KEY OFF:CLS:DEFINT A-Z
00070 DIM EX(5,11),EY(5,11)

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
00230 AL=1:CA=2:LA=2
00240 RESTORE 9000
00260 GOSUB 6000 : ' TABELA DE PADROES
00270 GOSUB 7000 : ' TABELA DE CORES 

00400 ' ************************************
00410 ' GAME LOOP  
00420 ' ************************************
00430 ' CARREGA A POSICAO DOS ALIENS
00440 FOR I = 0 TO 4
00450    FOR J = 0 TO 10
00460        EX(I,J)=(J+1)*CA
00470        EY(I,J)=LA+I
00480    NEXT J
00490 NEXT I

05000 ' ************************************
05010 ' POSICIONA OS ALIENS
05020 ' ************************************
05030 IF AL = 2 THEN AL = 1 ELSE AL = 2 
05040 FOR I = 0 TO 4
05050    FOR J = 0 TO 10
05060        CL=EX(I,J):LN=EY(I,J)
05070        VPOKE &H1800+CL+LN*32,AL 
05080    NEXT J
05090 NEXT I
05100 CA = CA + 1
05110 IF CA>20 THEN VX=VX*-1:LA= LA + 1
05120 END

06000 ' ************************************
06010 ' CARREGA A TABELA DE PADROES 
06020 ' ************************************
06030 S=0 
06040 READ R$
06050 IF R$="*" THEN RETURN 
06060 R=VAL("&H"+R$)
06070 VPOKE S,R
06080 S=S+1
06110 GOTO 6040

07000 ' ************************************
07010 ' CARREGA A TABELA DE CORES  
07020 ' ************************************
07020 FOR I=0 TO 31
07030   VPOKE &H2000+I,32
07040 NEXT I
07050 RETURN 

09000 ' ************************************
09010 ' SPRITES           
09020 ' ************************************
09130 ' ALIENS - COLOR 7
09140 DATA 00,00,00,00,00,00,00,00
09150 DATA 18,3C,7E,DB,FF,24,5A,A5
09170 DATA 18,3C,7E,DB,FF,5A,81,42
09180 DATA *