0010 SCREEN 0:WIDTH 40:KEY OFF:CLS:COLOR 15,1,1
0020 ?"==========================="
0030 ?"PROGRAMAS DE SPRITES       "
0040 ?"==========================="
0050 ?"(1)SPLASH SCREEN            "
0060 ?"(2)SANTA ANIMATION         "
0110 ?"(E)ND                      "
0120 ?"==========================="
0130 ?">";:OP$=INPUT$(1)
0150 IF OP$="1" THEN RUN"SPLASH.BAS"
0160 IF OP$="2" THEN RUN"SANTAAN.BAS"
0210 GOTO 10