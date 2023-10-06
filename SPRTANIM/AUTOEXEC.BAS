0010 SCREEN 0:WIDTH 40:KEY OFF:CLS:COLOR 15,1,1
0020 ?"==========================="
0030 ?"PROGRAMAS DE SPRITES       "
0040 ?"==========================="
0050 ?"(B)ASIC Sprites            "
0060 ?"(1)a Melhoria              "
0070 ?"(2)a Melhoria              "
0080 ?"(A)nimacao Simples         "
0090 ?"Sprites (8)X8 AMPLIADOS    "
0100 ?"Sprites 16X16 (R)EAIS      "
0110 ?"(E)ND                      "
0120 ?"==========================="
0130 ?">";:OP$=INPUT$(1)
0140 IF OP$="B" OR OP$="b" THEN RUN"SPRT01.BAS"
0150 IF OP$="1" THEN RUN"SPRT02.BAS"
0160 IF OP$="2" THEN RUN"SPRT03.BAS"
0170 IF OP$="A" OR OP$="a" THEN RUN"SPRVDP.BAS"
0180 IF OP$="8" THEN RUN"SPRT8X8A.BAS"
0190 IF OP$="R" OR OP$="r" THEN RUN"SPR16X16.BAS"
0200 IF OP$="E" OR OP$="e" THEN END
0210 GOTO 10