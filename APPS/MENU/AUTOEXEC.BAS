0010 ' =====================================
0020 ' TBC SPIDER BURNER 
0030 ' =====================================
0040  SCREEN 1:COLOR 2,0,0:KEYOFF

0100 ' =====================================
0110 ' ACERTA AS FORMAS DOS CARACTERES
0120 ' ===================================== 
0130 FOR C=&H41*8 TO &H5A*8
0140   VPOKE C+256,VPEEK(C)
0150 NEXT C

0200 ' =====================================
0210 ' MUDA AS CORES DE FUNDO
0220 ' =====================================
0230 CL=&H12 : ' TEXTO PRETO/FUNDO BRANCO
0240 VPOKE 8204,CL
0250 VPOKE 8205,CL
0260 VPOKE 8206,CL
0270 VPOKE 8207,CL
0280 VPOKE 8219,CL/16+(CL-(CL AND &HF0))*16

0300 ' =====================================
0310 ' LER AS OPCOES DO MENU
0320 ' ===================================== 
0330 OP=0:MX=0
0340 READ D$
0350 IF D$="*" THEN 500 :' CRIA MENU
0360 A$(MX,1)=LEFT$(D$+STRING$(7,CHR$(32)),8)
0370 FOR I=1 TO LEN(D$)
0380   MID$(D$,I,1)=CHR$(ASC(MID$(D$,I,1))+32)
0390 NEXT I
0400 A$(MX,2)=LEFT$(D$+STRING$(7,CHR$(219)),8)
0410 MX=MX+1:GOTO 340

0500 ' =====================================
0510 ' DESENHA A TELA 
0520 ' =====================================
0580 CY=0:GOSUB 9000:'DESENHA O HEADER
0590 CY=3:GOSUB 8000:'DESENHA O CORPO

0700 ' ===================================== 
0710 ' LOOP PRINCIPAL
0720 ' =====================================
0730 CY=4:GOSUB 5000:'DESENHA OPCOES DO MENU
0750 GOSUB 7000:'DESENHA SELECAO
0760 K$=INKEY$: IF K$="" THEN 720
0770 K=ASC(k$)
0780 IF K=30 OR K=31 THEN CY=4:GOSUB 6000 
0790 IF K=31 THEN OP=(OP+1) MOD MX
0800 IF K=30 THEN OP=OP-1:IF OP=-1 THEN OP=MX-1
0810 IF K=13 THEN 2000 : ' EXECUTA A OPCAO
0820 GOTO 730 

1000 ' =====================================
1010 ' DADOS DO MENU
1020 ' =====================================
1030 DATA ASCII,CORES,CRAB
1040 DATA *

2000 ' =====================================
2010 ' EXECUTA A OPCAO
2020 ' =====================================
2030 OP$ = A$(OP,1) 
2050 IF OP$="ASCII   " THEN RUN "ASCII.BAS"
2060 IF OP$="CORES   " THEN RUN "CORES.BAS"
2070 IF OP$="CRAB    " THEN RUN "CRAB.BAS"
2080 END

3000 ' =====================================
3010 ' CRIA UMA LINHA CAIXA PARA BAIXO
3020 ' =====================================
3030 LOCATE 0,CY:PRINT CHR$(1)+CHR$(&H58);
3040 FOR I = 1 TO 38
3050   LOCATE I,CY
3060   PRINT CHR$(1)+CHR$(&H57);
3070 NEXT I
3080 LOCATE 39,CY:PRINT CHR$(1)+CHR$(&H59);
3090 RETURN

4000 ' =====================================
4010 ' CRIA UMA LINHA DE CAIXA PARA CIMA
4020 ' =====================================
4030 LOCATE 0,CY:PRINT CHR$(1)+CHR$(&H5A);
4040 FOR I = 1 TO 38
4050   LOCATE I,CY
4060   PRINT CHR$(1)+CHR$(&H57);
4070 NEXT I
4080 LOCATE 39,CY:PRINT CHR$(1)+CHR$(&H5B);
4090 RETURN

5000 ' =====================================
5010 ' DESENHA AS OPCOES DO MENU
5020 ' =====================================
5030 FOR F=0 TO MX
5050   LOCATE 10,F+CY:PRINT A$(F,1)
5070 NEXT F 
5080 RETURN

6000 ' =====================================
6010 ' DESENHA SELECAO
6020 ' =====================================
6030 LOCATE 10,OP+CY:PRINT A$(OP,1)
6040 RETURN

7000 ' =====================================
7010 ' DESENHA SELECAO
7020 ' =====================================
7030 LOCATE 10,OP+CY:PRINT A$(OP,2)
7040 RETURN

8000 ' =====================================
8010 ' DESENHA O CORPO
8020 ' =====================================
8030 CY=3:GOSUB 3000:'DESENHA CAIXA P/ BAIXO
8040 FOR I = 4 TO 20
8050   LOCATE 00,I:PRINT CHR$(1)+CHR$(&H56);
8060   LOCATE 39,I:PRINT CHR$(1)+CHR$(&H56);
8070 NEXT I
8080 CY=21:GOSUB 4000:'DESENHA CAIXA P/ CIMA
8090 RETURN

9000 ' =====================================
9010 ' DESENHA HEADER
9020 ' =====================================
9030 CY=0:GOSUB 3000:'DESENHA CAIXA P/ BAIXO
9040 LOCATE 0,1:PRINT CHR$(1)+CHR$(&H56);
9050 LOCATE 6,1:PRINT "TBC BASIC SAMPLES";
9060 LOCATE 39,1:PRINT CHR$(1)+CHR$(&H56);
9070 CY=2:GOSUB 4000:'DESENHA CAIXA P/ CIMA
9080 RETURN
