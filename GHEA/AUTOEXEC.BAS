10 SCREEN 0:WIDTH 40:CLS:KEY OFF:DEFINT A-Z
20 ?"====================================="
30 ?"Ghea DandD Basic Adventure           "
40 ?"Manoel Neto 2023-01-17               "
50 ?"====================================="
60 ?"Este e um jogo de aventura basedo no "
70 ?"D&D Original    "
80 ?"====================================="
90 ?"(C)riar um personagem                "
100 ?"(P)roseguir na aventura              "
110 ?"(T)erminar o jogo                    "
120 ?"====================================="
130 ?">";
140 OP$=INPUT$(1)
150 IF OP$="C" OR OP$="c" THEN 800:'CRIA PERSONAGEM
160 IF OP$="P" OR OP$="p" THEN 9000:'CARREGA AVENTURA
170 IF OP$="T" OR OP$="t" THEN END:'FINALIZA O JOGO
180 ?"Opcao invalida!":FOR I=1 TO 300:NEXT I
190 GOTO 10
200 ' ==========================
210 ' SUBROTINA DE ABRIR DAT
220 ' ==========================
230 OPEN A$ FOR INPUT AS #1
240 INPUT #1, E$
250 PRINT E$
260 IF NOT EOF(1) THEN GOTO 240
270 CLOSE
280 RETURN
300 ' ==========================
310 ' SUBROTINA SORTEAR NUMERO
320 ' ==========================
330 SO=(VM*RND(-TIME))
340 RETURN 
400 ' ==========================
410 ' SUBROTINA DE GRAVAR CHR
420 ' ==========================
420 OPEN A$ FOR OUTPUT AS #1
425 PRINT #1,CL$
428 PRINT #1,NV
430 PRINT #1,HP
440 PRINT #1,AC
450 PRINT #1,ST
460 PRINT #1,IN
470 PRINT #1,WS
480 PRINT #1,DX
490 PRINT #1,CO 
500 PRINT #1,CH
510 PRINT #1,PO
520 PRINT #1,AV 
530 PRINT #1,SL
540 CLOSE
550 RETURN
600 ' ==========================
610 ' SUBROTINA DE LER CHR
620 ' ==========================
630 OPEN A$ FOR INPUT AS #1
635 INPUT #1,CL$
638 INPUT #1,NV
640 INPUT #1,HP
650 INPUT #1,AC
660 INPUT #1,ST
670 INPUT #1,IN
680 INPUT #1,WS
690 INPUT #1,DX
700 INPUT #1,CO 
710 INPUT #1,CH
720 INPUT #1,PO
730 INPUT #1,AV 
740 INPUT #1,SL
750 CLOSE
760 RETURN
800 ?
810 ?"====================================="
820 ?"VOCE NASCEU COM ESTES ATRIBUTOS"
830 ?"====================================="
840 GOSUB 10000:'SORTEIA OS ESCORES
850 GOSUB 12000:'IMPRIMIR FICHA
860 ?"====================================="
870 ?"Quer (C)ontinuar ou (N)ascer de novo?"
880 ?"====================================="
890 ?">"
900 OP$=INPUT$(1) 
910 IF OP$="c" OR OP$="C" THEN 1000:'ESCOLHE UMA CLASSE
920 IF OP$="n" OR OP$="N" THEN 800:'NASCER DE NOVO
930 GOTO 880 
1000 ?
1010 ?"====================================="
1020 ?"ESCOLHA UMA CLASSE                   "
1030 ?"====================================="
1040 ?"Escolha uma classe:                  "
1050 A$="CLASSES.DAT":GOSUB 200
1055 ?"(V)OLTAR PARA O INICIO"
1060 ?"====================================="
1070 ?">";
1080 OP$=""
1090 OP$=INPUT$(1) 
1100 IF OP$="G" OR OP$="g" THEN 2000 : ' GUERREIRO
1110 IF OP$="C" OR OP$="c" THEN 2500 : ' CLERIGO
1120 IF OP$="M" OR OP$="m" THEN 4000 : ' MAGO
1130 IF OP$="L" OR OP$="l" THEN 5000 : ' LADRAO
1140 IF OP$="E" OR OP$="e" THEN 6000 : ' ELFO
1150 IF OP$="H" OR OP$="h" THEN 7000 : ' HALFLING
1160 IF OP$="A" OR OP$="a" THEN 8000 : ' ANAO
1170 IF OP$="V" OR OP$="v" THEN 10   : ' VOLTAR
1180 ?"Opcao invalida!"
1190 GOTO 1070
2000 ' ==========================
2010 ' CRIAR GUERREIRO
2020 ' ==========================
2030 CL$="Guerreiro"
2040 AV=0:'COMECA NA AVENTURA 0
2050 SL=0:'COMECA NA SALA 0
2060 AC=10:'ARMADURA BASICA
2070 VM=7:'SORTEIO DO HP
2080 GOSUB 300:' SORTEIA O HP
2090 HP=SO+1:' SALVA O HP 
2100 GOSUB 11000:'SORTEIA AS PECAS DE OURO'
2110 GOSUB 12000:'IMPRIME A FICHA
2120 GOTO 8000:'SALVA O PERSONAGEM
8000 ' ====================================
8010 ' SALVAR PERSONAGEM                  
8020 ' ====================================
8030 ?"===================================="
8040 ?"Deseja manter esse personagem? (S/N)"
8050 ?"===================================="
8060 ?">";
8070 OP$=INPUT$(1)
8080 IF OP$="S" OR OP$="s" THEN 8120:'SALVA O PERSONAGEM
8090 IF OP$="N" OR OP$="n" THEN 10:'VOLTA AO INICIO
8100 ?"Opcao invalida!"
8110 GOTO 8060
8120 ' SALVA O PERSONAGEM NO DISCO 
8130 ?"===================================="
8140 ?"Qual seu nome? (maximo 8 letras)    "
8150 ?"===================================="
8160 ?">"
8170 A$=INPUT$(8)
8180 A$=A$+".CHR"
8190 ?"Seu nome será:";A$
8200 ?"Confirma? (S/N)"
8210 OP$=INPUT$(1)
8220 IF OP$="N" OR OP$="n" THEN 8130:'ENTRA O NOME 
8230 IF OP$="S" OR OP$="s" THEN 8250:'SALVA O PERSONAGEM
8240 ?"Opcao invalida!":GOTO 8200
8250 GOSUB 400
8260 ?"Personagem salvo."
8270 ?"Pressione <enter> para voltar ao inicio."
8280 GOTO 10 
9000 ?
9010 ?"=========================="
9020 ?"CONTINUAR AVENTURA        "
9030 ?"=========================="
9040 ?"Personagens ativos:       "
9050 FILES "*.CHR":?
9060 ?"=========================="
9070 ?"Qual personagem deseja continuar?"
9080 A$=INPUT$(8)
9090 A$=A$+".CHR"
9100 GOSUB 600 
9110 GOSUB 12000:'IMPRIME FICHA
9220 END
10000 ' ==========================
10010 ' SORTEAR OS ESCORES    
10020 ' ==========================
10025 NV=1
10030 VM=16     : ' SORTEIO DE FORCA
10040 GOSUB 300 : ' SORTEIA FORCA
10050 ST=SO+3   : ' SALVA A FORCA'
10070 VM=16     : ' SORTEIO DE INTELIGENCIA
10080 GOSUB 300 : ' SORTEIA INTELIGENCIA
10090 IN=SO+3   : ' SALVA A INTELIGENCIA'
10120 VM=16     : ' SORTEIO DE SABEDORIA
10130 GOSUB 300 : ' SORTEIA SABEDORIA
10140 WS=SO+3   : ' SALVA A SABEDORIA
10160 VM=16     : ' SORTEIO DE DEXTREZA
10170 GOSUB 300 : ' SORTEIA DEXTREZA
10180 DX=SO+3   : ' SALVA A DEXTREZA
10200 VM=16     : ' SORTEIO DE CONSTITUICAO
10210 GOSUB 300 : ' SORTEIA CONSTITUICAO
10220 CO=SO+3   : ' SALVA CONSTITUICAO
10240 VM=16     : ' SORTEIO DE CARISMA
10250 GOSUB 300 : ' SORTEIA CARISMA
10260 CH=SO+3   : ' SALVA CARISMA
10280 RETURN
11000 ' ==========================
11010 ' SORTEIA AS PECAS DE OURO
11020 ' ==========================
11030 VM=16
11040 GOSUB 300:'SORTEIA AS PECAS DE OURO
11050 PO=(SO+3)*10
11060 RETURN 
12000 ' ==========================
12010 ' IMPRIMIR FICHA            
12020 ' ==========================
12030 ?
12040 ?A$
12050 ?CL$;" ";NV
12060 ?"====================================="
12070 ?"ARMADURA:";AC;" ";"VIDA:";HP
12080 ?"====================================="
12090 ?"ATRIBUTOS" 
12100 ?"====================================="
12110 ?"FORCA          =>";ST
12120 ?"INTELIGENCIA   =>";IN
12130 ?"SABEDORIA      =>";WS
12140 ?"DESTREZA       =>";DX
12150 ?"CONSTITUICAO   =>";CO
12160 ?"CARISMA        =>";CH
12170 ?"====================================="
12180 ?"EQUIPAMENTO"
12190 ?"====================================="
12200 ?"PECAS DE OURO  =>";PO
12210 ?"====================================="
12999 RETURN