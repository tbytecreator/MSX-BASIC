0010 SCREEN 0:WIDTH 40:KEY OFF:CLS:COLOR 15,1,1
0020 ?"==========================="
0030 ?"PROGRAMAS DE SPRITES       "
0040 ?"==========================="
0050 ?"(B)ASIC Sprites            "
0060 ?"(1)a Melhoria              "
0070 ?"(2)a Melhoria              "
0080 ?"==========================="
0090 ?">";:OP$=INPUT$(1)
1020 IF OP$="B" OR OP$="b" THEN RUN"SPRT01.BAS"
1030 IF OP$="1" THEN RUN"SPRT02.BAS"
1040 IF OP$="2" THEN RUN"SPRT03.BAS"
2000 GOTO 10