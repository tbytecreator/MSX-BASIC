0010 ' ********************************
0020 ' LIMITES DOS SPRITES EM BASIC    
0030 ' ********************************
0040 ' 8X8   : 256 MODELOS DE SPRITES
0050 ' 16X16 : 64 MODELOS DE SPRITES   
0060 ' ********************************
0070 ' 1. OS SPRITES NAO FUNCIONAM EM 
0080 '    SCREEN 0
0090 ' 2. UM SPRITE POR CAMADA
0100 ' 3. MAXIMO DE 32 CAMADAS
0110 ' 4. APENAS 4 SPRITES POR LINHA
0120 ' 5. O SPRITE NA CAMADA MENOR 
0130 '    SOBREPOE A CAMADA MAIOR                  
0140 ' ********************************
0150 DEFINT A-Z:SCREEN 2:COLOR 15,1,1
0160 GOSUB 1000 : ' CARREGA SPRITES 
0170 FOR I = 0 TO 6 
0180   PUT SPRITE I,(I*8,I),2,0 
0190 NEXT 
0200 OP$=INPUT$(1)
0210 RUN"AUTOEXEC.BAS"
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