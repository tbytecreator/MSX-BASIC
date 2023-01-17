05 SCREEN 0:WIDTH 40:CLS:KEY OFF:DEFINT A-Z
10 ?"=========================="
20 ?"Ghea DandD Basic Adventure"
30 ?"Manoel Neto 2023-01-17    "
40 ?"=========================="
50 ?"Este e um jogo de aventura"
60 ?"basedo no D&D Original    "
70 ?"=========================="
80 ?"(C)riar um personagem     "
90 ?"(P)roseguir na aventura   "
95 ?"(T)erminar o jogo         "
100 ?"=========================="
110 ?">";
120 OP$=INPUT$(1)
130 IF OP$="C" OR OP$="c" THEN 1000 : 'CRIA PERSONAGEM
140 IF OP$="P" OR OP$="p" THEN 9000 : 'CARREGA AVENTURA
150 IF OP$="T" OR OP$="t" THEN 3000 : 'FINALIZA O JOGO
160 ?"Opcao invalida!":FOR I=1 TO 300:NEXT I
170 GOTO 05
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
330 SO=(VM*RND(-TIME))+3
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
510 PRINT #1,AV 
520 PRINT #1,SL
530 CLOSE
540 RETURN
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
720 INPUT #1,AV 
730 INPUT #1,SL
740 CLOSE
750 RETURN
1000 ?
1010 ?"=========================="
1020 ?"CRIACAO DE PERSONAGEM     "
1030 ?"=========================="
1040 ?"Escolha uma classe:       "
1050 A$="CLASSES.DAT":GOSUB 200
1055 ?"(V)OLTAR PARA O INICIO"
1060 ?"=========================="
1070 ?">";
1080 OP$=""
1090 OP$=INPUT$(1) 
1100 IF OP$="G" OR OP$="g" THEN 2000 : ' GUERREIRO
1110 IF OP$="C" OR OP$="c" THEN 3000 : ' CLERIGO
1120 IF OP$="M" OR OP$="m" THEN 4000 : ' MAGO
1130 IF OP$="L" OR OP$="l" THEN 5000 : ' LADRAO
1140 IF OP$="E" OR OP$="e" THEN 6000 : ' ELFO
1150 IF OP$="H" OR OP$="h" THEN 7000 : ' HALFLING
1160 IF OP$="A" OR OP$="a" THEN 8000 : ' ANAO
1165 IF OP$="V" OR OP$="v" THEN 5    : ' VOLTAR
1170 ?"Opcao invalida!"
1180 GOTO 1070
2000 ' ==========================
2010 ' CRIAR GUERREIRO
2015 ' ==========================
2016 CL$="Guerreiro"
2017 NV=1 
2018 ?CL$;" ";NV
2019 ?"=========================="
2020 VM=8      : ' SORTEIO DO HP
2030 GOSUB 300 : ' SORTEIA O HP
2040 HP=SO     : ' SALVA O HP 
2045 ?
2050 ?"PONTOS DE VIDA =>";HP
2060 AC=10
2070 ?"ARMADURA       =>";AC
2080 VM=16     : ' SORTEIO DE FORCA
2090 GOSUB 300 : ' SORTEIA FORCA
2100 ST=SO     : ' SALVA A FORCA'
2110 ?"FORCA          =>";ST
2120 VM=16     : ' SORTEIO DE INTELIGENCIA
2130 GOSUB 300 : ' SORTEIA INTELIGENCIA
2140 IN=SO     : ' SALVA A INTELIGENCIA'
2150 ?"INTELIGENCIA   =>";IN
2160 VM=16     : ' SORTEIO DE SABEDORIA
2170 GOSUB 300 : ' SORTEIA SABEDORIA
2180 WS=SO     : ' SALVA A SABEDORIA
2190 ?"SABEDORIA      =>";WS
2200 VM=16     : ' SORTEIO DE DEXTREZA
2210 GOSUB 300 : ' SORTEIA DEXTREZA
2220 DX=SO     : ' SALVA A DEXTREZA
2230 ?"DESTREZA       =>";DX
2240 VM=16     : ' SORTEIO DE CONSTITUICAO
2250 GOSUB 300 : ' SORTEIA CONSTITUICAO
2260 CO=SO     : ' SALVA CONSTITUICAO
2270 ?"CONSTITUICAO   =>";CO
2280 VM=16     : ' SORTEIO DE CARISMA
2290 GOSUB 300 : ' SORTEIA CARISMA
2300 CH=SO     : ' SALVA CARISMA
2310 ?"CARISMA        =>";CH
2320 AV=0 : ' COMECA NA AVENTURA 0
2330 SL=0 : ' COMECA NA SALA 0
2340 ?:?"Seu Guerreiro esta no inicio."
2800 ?"Deseja manter esse personagem? (S/N)"
2810 OP$=INPUT$(1)
2820 IF OP$="S" OR OP$="s" THEN 2900 : ' SALVA O PERSONAGEM
2830 GOTO 1000
2900 ' SALVA O PERSONAGEM NO DISCO 
2910 ?
2920 ?"Qual seu nome (maximo 8 letras)?";
2930 A$=INPUT$(8)
2940 A$=A$+".CHR"
2950 GOSUB 400
2960 ?"Personagem salvo.":FOR I=1 TO 300:NEXT I
2970 GOTO 05 
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
9110 ?:? A$;" ";CL$;" ";NV
9115 ?"=========================="
9120 ?"PONTOS DE VIDA =>";HP
9130 ?"ARMADURA       =>";AC
9140 ?"FORCA          =>";ST
9150 ?"INTELIGENCIA   =>";IN
9160 ?"SABEDORIA      =>";WS
9170 ?"DESTREZA       =>";DX
9180 ?"CONSTITUICAO   =>";CO
9190 ?"CARISMA        =>";CH
9200 ?"=========================="
9210 END


