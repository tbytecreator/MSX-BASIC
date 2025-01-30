00010 SCREEN 0:WIDTH 40:CLS:KEY OFF:DEFINT A-Z
00020 ?"====================================="
00030 ?"Ghea DandD Basic Adventure           "
00040 ?"Manoel Neto 2023-01-17               "
00050 ?"====================================="
00060 ?"Este e um jogo de aventura basedo no "
00070 ?"D&D Original                         "
00080 ?"====================================="
00090 ?"(C)riar um personagem                "
00100 ?"(P)roseguir na aventura              "
00110 ?"(T)erminar o jogo                    "
00120 ?"====================================="
00130 ?">";
00140 OP$=INPUT$(1)
00150 IF OP$="C" OR OP$="c" THEN 1000:'CRIA PERSONAGEM
00160 IF OP$="P" OR OP$="p" THEN 2000:'CARREGA AVENTURA
00170 IF OP$="T" OR OP$="t" THEN END:'FINALIZA O JOGO
00180 ?"Opcao invalida!":FOR I=1 TO 300:NEXT I
00190 GOTO 10

01000 '=================================='
01010 'CRIA PERSONAGEM                   '
01020 '=================================='
01030 ?"Aguarde enquanto os deuses definem a sua sorte..."
01040 RUN"CRIAPERS.BAS"

02000 '=================================='
02010 'CARREGA AVENTURA                  '
02020 '=================================='
02030 ?:?"Personagens ativos:"
02035 ?"================================="
02040 FILES "*.CHR":?
02060 ?"================================="
02070 ?"Qual personagem deseja continuar?"
02075 ?">";
02080 A$=INPUT$(8)
02090 A$=A$+".CHR"
02100 GOSUB 11000:'CARREGA PERSONAGEM 
02110 GOSUB 12000:'IMPRIME FICHA
02120 ?:?"================================="
02130 ?"Iniciar aventura? (S)im ou (N)ao"
02140 ?"================================="
02150 ?">";
02160 OP$=INPUT$(1)
02170 IF OP$="S" OR OP$="s" THEN RUN"MAPGEN.BAS"
02180 IF OP$="N" OR OP$="n" THEN 10
02190 GOTO 2000

11000 ' ==========================
11010 ' SUBROTINA DE LER CHR
11020 ' ==========================
11030 OPEN A$ FOR INPUT AS #1
11040 INPUT #1,CL$
11050 INPUT #1,NV
11060 INPUT #1,HP
11070 INPUT #1,AC
11080 INPUT #1,ST
11090 INPUT #1,IN
11100 INPUT #1,WS
11110 INPUT #1,DX
11120 INPUT #1,CO 
11130 INPUT #1,CH
11140 INPUT #1,PO
11150 INPUT #1,AV 
11160 INPUT #1,SL
11170 CLOSE
11180 RETURN

12000 ' ==========================
12010 ' IMPRIMIR FICHA            
12020 ' ==========================
12030 ?
12040 ?A$
12050 ?CL$;" ";NV
12060 ?"====================================="
12070 ?"ARMADURA:";AC;" ";"VIDA:";HP
12080 ?"====================================="
12090 ?"ATRIBUTOS                            " 
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