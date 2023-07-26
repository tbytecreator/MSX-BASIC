0010 SCREEN 0:WIDTH 40:KEY OFF:CLS:COLOR 15,1,1
0020 ?"==========================="
0030 ?"PROGRAMAS DE SPRITES       "
0040 ?"==========================="
0050 ?"(B)ASIC Sprites            "
1000 ?"==========================="
1010 ?">";:OP$=INPUT$(1)
1020 IF OP$="B" OR OP$="b" THEN RUN"SPRT01.BAS"
2000 GOTO 10