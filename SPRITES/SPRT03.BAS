010 ' ********************************
020 ' LIMITES DOS SPRITES EM BASIC    
030 ' ********************************
040 ' 8X8   : 256 MODELOS DE SPRITES
050 ' 16X16 : 64 MODELOS DE SPRITES   
060 ' ********************************
070 ' 1. OS SPRITES NAO FUNCIONAM EM 
080 '    SCREEN 0
090 ' 2. UM SPRITE POR CAMADA
100 ' 3. MAXIMO DE 32 CAMADAS
110 ' 4. APENAS 4 SPRITES POR LINHA
120 ' 5. O SPRITE NA CAMADA MENOR 
130 '    SOBREPOE A CAMADA MAIOR                  
140 ' ********************************
150 DEFINT A-Z:SCREEN 2,0:COLOR 15,1,1
160 GOSUB 1000 : ' CARREGA SPRITES 
170 FOR I = 0 TO 6 
180   PUT SPRITE I,(I*8,I),2,0 
190 NEXT 
200 OP$=INPUT$(1)
210 RUN"AUTOEXEC.BAS"
1000 ' ******************************'
1010 ' CARREGA DIRETO NO VDP         '
1020 ' ******************************'
1030 S=BASE(9)
1040 READ R$
1050 IF R$="*" THEN RETURN ELSE VPOKE S,VAL("&H"+R$):S=S+1
1060 GOTO 1040 
9000 ' ******************************'
9010 ' MASCARA DOS SPRITES           '
9020 ' ******************************'
9030 DATA 18,3C,7E,DB,FF,24,5A,A5,*