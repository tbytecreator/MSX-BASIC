0010 SCREEN 0:WIDTH 40:KEY OFF:CLS:COLOR 15,1,1
0020 ?"================================="
0030 ?"PROGRAMAS DE DISCO               "
0040 ?"================================="
0050 ?"(1)INFORMACOES DO DISCO          "
0060 ?"(2)ORDENAR DISCO                 "
0999 ?"(F)FIM DO PROGRAMA               "
1000 ?"================================="
1010 ?">";:OP$=INPUT$(1)
1020 IF OP$="1" THEN RUN"DISKINFO.BAS"
1030 IF OP$="2" THEN RUN"DIRORD.BAS"
1999 IF OP$="F" OR OP$="f" THEN END
2000 GOTO 10