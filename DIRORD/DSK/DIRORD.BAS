10 ' --------------------------------
20 ' Ordenador de Diretorio
30 ' Aldo Barduco Junior -88
40 ' ALTERADO POR MANOEL NETO 2024
50 ' 2024-02-18
60 ' --------------------------------
70 DEFSNG A-Z
80 CLEAR 5000,&HBFFF:WIDTH 38
90 DIM N$(112),N(112):KEY OFF
100 KEY 1,SPACE$(6):KEY 6,SPACE$(6)
110 KEY 2,"   ###":KEY 7,"   ###"
120 KEY 3,"TECLE ":KEY 8, "TECLE "
160 kEY 4,"ENTER ":KEY 9, "ENTER "
140 KEY 5,"###":KEY 10,"###"
150 COLOR 14,1, 1
170 ' TRAVA CAPS LOCK
190 POKE &HFCAB,&H30
200 GOSUB 890: ' CABECALHO
240 ? "LENDO DIRETORIO"
250 ' --------------------------------
260 ' ROTINA DE LEITURA
270 ' --------------------------------
280 FOR H=5 TO 11
290   E=49152!+(H-5)*512
292   E2=INT(E/256)
294   E1=E-INT(E/256)*256
300   POKE &HF351,E1
305   POKE &HF352,E2
310   A$=DSKI$(0,H)
311   ? A$
320   FOR G=0 TO 511 STEP 32
330     FOR F=0 TO 31
340       A$=A$+CHR$(PEEK(F+G+E))
350     NEXT
360     IF LEFT$(A$,1)=CHR$(0) THEN 440
370     IF A$>"a" OR A$<"A" THEN 420
380     S=S+1
390     N(S)=F+G+E-32
400     N$(S)=A$
402     K$=LEFT$(N$(S),8)+"."+MID$(N$(S),9,3)
403     ? K$;
410     IF S\2=S/2 THEN ? K$;"SETOR:";USING "##";H ELSE ? K$;
420     A$=""
430   NEXT G
431 NEXT H
440 FOR F=1 TO 70:IF F\5=F/5 THEN BEEP
450 NEXT F
460 COLOR 15
470 KEY ON
480 K$=INKEY$:IF K$<>CHR$(13) THEN 480
490 KEY OFF
510 ' --------------------------------
520 ' ROTINA DE ORDENACAO
530 ' --------------------------------
540 ? "ORDENACAO: CRESCENTE"
560 ? "EXECUTANDO ORDENACAO DO DIRETORIO"
570 FOR G=1 TO S-1
580   FOR F=G+1 TO S
590     IF N$(G)<N$(F) THEN 620
600     SWAP N$(G),N$(F)
610     Y=1
620   NEXT F
630   IF Y=1 THEN Y=0
632 NEXT G
640 IF G=1 THEN ? "DIRETORIO JA ESTA ORDENADO":END
650 BEEP:BEEP:COLOR 7
660 FOR G=1 TO S
670   FOR F=0 TO 31
680     POKE N(G)+F,ASC(CHR$(34)+MID$(N$(G),F+1,1)+CHR$(34))
690   NEXT F
695 NEXT G
700 BEEP:BEEP:COLOR 5
710 ' --------------------------------
720 ' ROTINA DE GRAVACAO
730 ' --------------------------------
750 ? "GRAVANDO DIRETORIO"
755 ?
760 'FOR H=5 TO 11
770 ''  E=49152!+(H-5)*512
772  '' E2=INT(E/256)
773 ''  E1=E-INT(E/256)*256
780  '' POKE &HF351,E1
782  '' POKE &HF352,E2
790  '' DSKO$ 0,H
800 'NEXT H
810 FILES
820 KEY ON
830 K$=INKEY$:IF K$<>CHR$(13) THEN 830
840 KEY OFF
850 RUN"AUTOEXEC.BAS"
860 ' --------------------------------
870 ' CABECALHO
880 ' --------------------------------
890 CLS
900 ? STRING$(36,"-")
910 ? "ORDENADOR DE DIRETORIO"
920 ? "ORDENANDO A UNIDADE PADRAO"
930 ? STRING$(36,"-")
940 RETURN