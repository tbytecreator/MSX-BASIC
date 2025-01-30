10 INPUT "Digite a string: "; A$
20 FOR I = 1 TO LEN(A$)
30 IF MID$(A$, I, 1) = "@" THEN MID$(A$, I, 1) = " "
40 NEXT I
50 PRINT "String modificada: "; A$
60 OP$ = INPUT$(1)
70 RUN "AUTOEXEC.BAS"