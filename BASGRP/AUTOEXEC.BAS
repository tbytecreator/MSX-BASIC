0010 SCREEN 0:WIDTH 40:KEY OFF:CLS:COLOR 15,1,1
0020 ?"================================="
0030 ?"PROGRAMAS GRAFICOS               "
0040 ?"================================="
0050 ?"(T)ELAS                          "
0060 ?"(C)ORES                          "
0070 ?"(S)TAR                           "
0080 ?"(1)COLOR SPILL 1                 "
0090 ?"(2)COLOR SPILL 2                 "
0999 ?"(E)ND                            "
1000 ?"================================="
1010 ?">";:OP$=INPUT$(1)
1020 IF OP$="C" OR OP$="c" THEN RUN"CORES.BAS"
1030 IF OP$="T" OR OP$="t" THEN RUN"TELAS.BAS"
1040 IF OP$="S" OR OP$="s" THEN RUN"STAR.BAS"
1050 IF OP$="1" THEN RUN"CLRSPL01.BAS"
1060 IF OP$="2" THEN RUN"CLRSPL02.BAS"
1999 IF OP$="E" OR OP$="e" THEN END
2000 GOTO 10