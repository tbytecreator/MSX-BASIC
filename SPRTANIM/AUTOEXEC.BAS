0010 SCREEN 0:WIDTH 40:KEY OFF:CLS 
0020 ?"================================="
0030 ?"PROGRAMAS DE SPRITES             "
0040 ?"================================="
0050 ?"(B)ASIC Sprites                  "
0060 ?"(V)dp Sprites                    "
0999 ?"(E)ND                            "
1000 ?"================================="
1010 ?">";:OP$=INPUT$(1)
1020 IF OP$="B" OR OP$="b" THEN RUN"SPRBASIC.BAS"
1030 IF OP$="V" OR OP$="v" THEN RUN"SPRVDP.BAS"
1999 IF OP$="E" OR OP$="e" THEN END
2000 GOTO 10