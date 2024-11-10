00010 SCREEN 0:WIDTH 40:CLS:KEY OFF
00020 DEFINT A-Z:DIM M(5,4):SL=1
00030 GOSUB 9000 : 'CARREGA MAPA DE SALAS
00040 A$="12345678.chr": GOSUB 10000 
00050 ?:?"================================="
00060 ?"Ghea DandD Map Generator         "
00070 ?"Manoel Neto 2023-01-17           "
00080 ?"================================="
00090 ?"Voce esta na sala ";SL
00100 ?"================================="
00110 GOSUB 8000:'VERIFICA SAIDAS DA SALA
00120 ?"================================="
00130 ?">";
00140 OP$=INPUT$(1)
00150 IF (OP$="N" OR OP$="n") AND M(SL,1)=0 THEN ?"Nao ha saida para o norte":GOTO 50
00160 IF (OP$="S" OR OP$="s") AND M(SL,2)=0 THEN ?"Nao ha saida para o sul":GOTO 50
00170 IF (OP$="L" OR OP$="l") AND M(SL,3)=0 THEN ?"Nao ha saida para o leste":GOTO 50
00180 IF (OP$="O" OR OP$="o") AND M(SL,4)=0 THEN ?"Nao ha saida para o oeste":GOTO 50
00190 IF OP$="N" OR OP$="n" THEN SL=M(SL,1):GOTO 50
00200 IF OP$="S" OR OP$="s" THEN SL=M(SL,2):GOTO 50
00210 IF OP$="L" OR OP$="l" THEN SL=M(SL,3):GOTO 50
00220 IF OP$="O" OR OP$="o" THEN SL=M(SL,4):GOTO 50
00230 GOTO 50

08000 '=================================='
08010 'VERIFICA SAIDAS DA SALA           '     
08020 '=================================='
08030 IF M(SL,1) <> 0 THEN ?"(N)orte"            
08040 IF M(SL,2) <> 0 THEN ?"(S)ul"
08050 IF M(SL,3) <> 0 THEN ?"(L)este"
08060 IF M(SL,4) <> 0 THEN ?"(O)este"
08070 RETURN      

09000 '=================================='
09010 'CARREGA MAPA DE SALAS             '
09020 '=================================='
09030 FOR B = 1 TO 5
09040   FOR C = 1 TO 4
09050     READ M(B,C)
09060   NEXT C
09070 NEXT B
09080 RETURN

10000 ' ==========================
10010 ' SUBROTINA DE LER CHR
10020 ' ==========================
10030 OPEN A$ FOR INPUT AS #1
10040 INPUT #1,CL$
10050 INPUT #1,NV
10060 INPUT #1,HP
10070 INPUT #1,AC
10080 INPUT #1,ST
10090 INPUT #1,IN
10110 INPUT #1,WS
10120 INPUT #1,DX
10130 INPUT #1,CO 
10140 INPUT #1,CH
10150 INPUT #1,PO
10160 INPUT #1,AV 
10170 INPUT #1,SL
10180 CLOSE
10190 RETURN

11000 '=================================='
11010 'TABELA DE MOVIMENTOS POSSIVEIS    '
11020 '=================================='
11030 DATA 0,2,3,0 : ' SALA 1
11040 DATA 1,0,5,0 : ' SALA 2
11050 DATA 0,4,0,1 : ' SALA 3
11060 DATA 3,5,0,0 : ' SALA 4
11070 DATA 4,0,0,2 : ' SALA 5