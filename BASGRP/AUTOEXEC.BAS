0010 SCREEN 0:WIDTH 40:KEY OFF:CLS 
0020 ?"================================="
0030 ?"PROGRAMAS GRAFICOS               "
0040 ?"================================="
0050 ?"(C)ORES                          "
0999 ?"(E)ND                            "
1000 ?"================================="
1010 ?">";:OP$=INPUT$(1)
1020 IF OP$="C" OR OP$="c" THEN RUN"CORES.BAS"
1999 IF OP$="E" OR OP$="e" THEN END
2000 GOTO 10