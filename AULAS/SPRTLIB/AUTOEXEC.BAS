0010 SCREEN 0:WIDTH 40:KEY OFF:CLS:COLOR 15,1,1
0020 ?"==========================="
0030 ?"SPRITELIB SPACE INVADERS   "
0040 ?"==========================="
0050 ?"(1) Alien 1                "
0060 ?"(2) Alien 2                "
0070 ?"(3) Alien 3                "
0110 ?"(E)ND                      "
0120 ?"==========================="
0130 ?">";:OP$=INPUT$(1)
0140 IF OP$="1" THEN RUN"ALIEN1.BAS"
0150 IF OP$="2" THEN RUN"ALIEN2.BAS"
0160 IF OP$="3" THEN RUN"ALIEN3.BAS"
0200 IF OP$="E" OR OP$="e" THEN END
0210 GOTO 10