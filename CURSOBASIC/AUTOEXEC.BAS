0010 SCREEN 0:WIDTH 40:KEY OFF:CLS 
0020 ?"================================="
0030 ?"PROGRAMAS DO LIVRO CURSO DE BASIC"
0040 ?"================================="
0050 ?"(C)IRCULOS RANDOMICOS            "
0060 ?"C(A)RACTERES (P)RINT             "
0070 ?"(T)exto Teste 1 Texto Teste (2)  "
0080 ?"P(O)ntos (G)relha                "
0090 ?"                                 "
0100 ?"                                 "
0999 ?"(E)ND                            "
1000 ?"================================="
1010 ?">";:OP$=INPUT$(1)
1020 IF OP$="C" OR OP$="c" THEN RUN"CB19.BAS"
1030 IF OP$="A" OR OP$="a" THEN RUN"CB26.BAS"
1040 IF OP$="P" OR OP$="p" THEN RUN"CB32.BAS"
1050 IF OP$="T" OR OP$="t" THEN RUN"CB34-1.BAS"
1060 IF OP$="2" OR OP$="2" THEN RUN"CB34-2.BAS"
1070 IF OP$="O" OR OP$="o" THEN RUN"CB55.BAS"
1080 IF OP$="G" OR OP$="g" THEN RUN"CB57.BAS"
1999 IF OP$="E" OR OP$="e" THEN END
2000 GOTO 10