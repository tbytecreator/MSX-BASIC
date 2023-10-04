0010 ' ********************************
0020 ' SPRITES EM BASIC
0030 ' EXISTE MAIS DE UMA FORMA DE SE 
0040 ' DEFINIR UM SPRITE, AQUI TEMOS 
0050 ' ALGUMAS MELHORIAS           
0060 ' ********************************
0070 DEFINT A-Z:COLOR 15,1,1:SCREEN 2,0
0090 GOSUB 1000 : ' CARREGA SPRITES
0100 SPRITE$(1)=S$
0110 PUT SPRITE 0,(119,90),4,1
0120 OP$=INPUT$(1)
0130 RUN"AUTOEXEC.BAS"
1000 ' ******************************'
1010 ' CARREGA O SPRITE              '
1020 ' ******************************'
1030 FOR I = 1 TO 8
1040   READ L 
1050   S$=S$+CHR$(L)
1060 NEXT 
1070 RETURN 
9000 ' ******************************'
9010 ' PADRAO DO SPRITE              '
9020 ' ******************************'
9030 DATA 24,60,126,219,255,36,90,165