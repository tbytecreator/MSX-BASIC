0010 SCREEN 0:WIDTH 40:KEY OFF:CLS:COLOR 15,1,1
0020 ?"==========================="
0030 ?"EFEITO SONOROS             "
0040 ?"==========================="
0050 ?"(1)ALARME                  "
0060 ?"(2)ATERRISAGEM             "
0110 ?"(3)DECOLAGEM               "
0120 ?"(4)SIRENE                  "
0130 ?"==========================="
0140 ?">";:OP$=INPUT$(1)
0150 IF OP$="1" THEN RUN"ALARME1.BAS"
0160 IF OP$="2" THEN RUN"ATERR.BAS"
0170 IF OP$="3" THEN RUN"DECOLAGEM.BAS"
0180 IF OP$="4" THEN RUN"SIRENE.BAS"
0190  GOTO 10