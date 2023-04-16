100 ' ********************************
110 ' LIMITES DOS SPRITES EM BASIC    
111 ' 8X8: 256 SPRITES, 4 POR LINHA   
112 ' 
113 '  
114 '                  
120 ' ********************************'
130 COLOR 15,1,1
140 SCREEN 2,0
150 DEFINT A-Z
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
9030 DATA 18,3C,7E,DB,FF,24,5A,A5
9040 DATA *