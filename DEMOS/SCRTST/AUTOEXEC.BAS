0010 SCREEN 0:WIDTH 80:KEY OFF:CLS:COLOR 15,1,1
0020 ?"==========================="
0030 ?"PROGRAMAS DE SPRITES       "
0040 ?"==========================="
0050 ?"(1)Logo Canal SC7          "
0060 ?"(2)TByteCreator SC2        "
0070 ?"(3)TByteCreator SC7        "
0080 ?"(4)TByteCreator SC8        "
0090 ?"(5)TByteCreator SC12       "
0999 ?"(E)ND                      "
1000 ?"==========================="
1010 ?">";:OP$=INPUT$(1)
1020 IF OP$="1" THEN RUN"LOGOSC07.BAS"
1030 IF OP$="2" THEN RUN"TLOGOS02.BAS"
1040 IF OP$="3" THEN RUN"TLOGOS07.BAS"
1050 IF OP$="4" THEN RUN"TLOGOS08.BAS"
1060 IF OP$="5" THEN RUN"TLOGOS12.BAS"
1999 IF OP$="E" OR OP$="e" THEN END
2000 GOTO 10