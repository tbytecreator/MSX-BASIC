10 REM ALIEN
20 REM
30 REM MSX Computer Magazine
40 REM
50 '---ALIEN---13-9-1985---
60 '-----------------------
70 '
80 CLS: KEY OFF: CLEAR 5000: GOSUB 790: GOTO 250
90 FOR I=0 TO 11: A=STICK(CT): IF A<2 OR A=5 THEN 120
100 XS=S*ABS(A=2 OR A=3 OR A=4)-S*ABS(A=6 OR A=7 OR A=8)
110 X=(X+XS) AND 255: PUT SPRITE P,(X,Y),15,P

120 IF ABS(X-AX)<16 AND ABS(Y-AY)<16 THEN EX=2
130 IF EX THEN GOSUB 340: EX=0
140 X(I)=X(I)+ST: IF S(I)=1 THEN PUT SPRITE(I),(X(I),Y(I)),Z,I
150 IF A<2 OR A=5 THEN 160 ELSE X=(X+XS) AND 255: PUT SPRITE P,(X,Y),15,P
160 IF AF=0 THEN 220 ELSE AX=INT(AX+XI) AND 255: AY=AY+2:PUT SPRITE AT,(AX,AY),Z,AT
170 IF AY>175 AND AF THEN AY=0: AF=0: S(AT)=1: PUT SPRITE AT,(X(AT),Y(AT)),Z,AT
180 IF I>3 THEN SPRITE$(I)=S$(SW)
190 Q=ABS(X-AX): IF Q<25 AND AY<145 THEN XI=XI+((2+LV)*SGN(RND(-TIME)*2+.5))
200 IF AY>145 THEN XI=((X+5-AX)/(Y+9-AY))*(2+LV*3)
210 IF TIME>T% THEN PSET(TX,191),1: TX=TX-1: TIME=0
220 NEXT I: IF SW=3 THEN SW=4 ELSE SW=3
230 IF TX<20 THEN 610
240 N=N+1: IF N=80 THEN N=0: ST=ST*-1

250 IF AF THEN 270 ELSE IF SY>98 OR SA=0 THEN 610
260 AT=INT(RND(-TIME)*12): IF S(AT)=0 THEN 260 ELSE S(AT)=2: AF=1:AX=X(AT):AY=Y(AT): SPRITE$(P)=S$(SD)
270 IF AY<145 THEN XI=(((X+5-AX)/(Y+9-AY))*ABS((X-AX)/40)+LV*2)*SGN(RND(-TIME)*2-.5): S=ABS(XI)*.6+5: GOTO 90
280 GOTO 90

290 ' SCHIETEN **********************
300 SOUND 6,10: SOUND 12,10: SOUND 13,0
310 BX=X: BY=Y-17: SD=9: SPRITE$(P)=S$(SD): PUT SPRITE P,(X,Y),15,P: PUT SPRITE BP,(BX,BY),15,BP
320 STRIG(CT) OFF: ON INTERVAL=3 GOSUB 430: INTERVAL ON
330 RETURN
340 STRIG(CT) STOP: M$=SPRITE$ (AT): IF EX=2 THEN SA=SA-1: GOSUB 510: GOTO 380
350 BX=255: BY=0: SD=0: SPRITE$ (P)=S$(SD): PUT SPRITE P,(X,Y),15,P: PUT SPRITE BP,(BX,BY),Z,BP: SY=SY+1: IF AT<4 THEN SY=SY+1: IF AT=0 THEN SY=SY+1
360 GOSUB 540: LINE (55,1)-(72,11),6,BF
370 DRAW "BM57,2": DRAW N$(INT(SY/10)): DRAW "BM64,2": DRAW N$(SY-INT(SY/10)*10): STRIG(CT) ON: RETURN
380 STRIG(CT) OFF: LINE (142,1)-(159,11),6,BF
390 DRAW "BM144,2": DRAW N$(INT(SA/10)): DRAW "BM151,2": DRAW N$(SA-INT(SA/10)*10)
400 AY=0: AF=0: S(AT)=1: PUT SPRITE AT,(X(AT),Y(AT)),Z,AT
410 SPRITE$(AT)=M$: STRIG(CT)ON: RETURN
420 ' INTERVAL ROUTINE **************
430 IF BY<85 THEN BX=255: BY=209: SD=0: SPRITE$(P)=S$(SD): PUT SPRITE P,(X,Y),15,P: INTERVAL OFF: STRIG(CT) ON: GOTO 450
440 IF ABS(BX-AX)<8 AND ABS(BY-AY)<11 THEN EX=1: INTERVAL OFF: RETURN
450 BY=BY-(6+LV*2): PUT SPRITE BP,(BX,BY),15,BP: RETURN
460 TIME=0: LV=LV+1: SA=SA+1: LINE (142,1)-(159,11),6,BF: DRAW "BM144,2": DRAW N$(INT(SA/10)): DRAW "BM151,2": DRAW N$(SA-INT(SA/10)*10)
470 LINE (222,1)-(232,11),13,BF: TX=110+LV*5+20: LINE (20,191)-(TX,191),15: T%=TD
480 DRAW "BM224,2": DRAW N$(LV)
490 DC=0: FOR V=0 TO 11: S(V)=1: NEXT V: RETURN
500 ' EXPLOSIE ROUTINE **************
510 SOUND 6,31: SOUND 12,40: SOUND 13,0: AY=0: AF=0: S(AT)=1: PUT SPRITE AT,(X(AT),Y(AT)),15,AT
520 FOR E3=0 TO 25: FOR E2=5 TO 7: SPRITE$(P)=S$(E2): NEXT E2: NEXT E3
530 BX=255: BY=209: SD=0: SPRITE$(P)=S$(0): PUT SPRITEBP,(BX,BY),15,BP: RETURN
540 SOUND 6,31: SOUND 12,40: SOUND 13,0:FOR E3=0 TO 11: FOR E2=5 TO 7: SPRITE$(AT)=S$(E2): PUT SPRITE AT,(AX,AY),15,AT: NEXT E2: NEXT E3: AF=0: AY=209: S(AT)=0: PUT SPRITE AT,(AX,AY),Z,AT: SPRITE$(AT)=M$: DC=DC+1
550 IF DC=12 THEN GOSUB 460: TIME=0
560 RETURN
570 ' ON ERROR AFHANDELING **********
580 IF ERR=5 AND ERL=160 THEN RESUME 220
590 ON ERROR GOTO 0

600 ' TIME OUT **********************
610 INTERVAL OFF: BY=0: GOSUB 430: STRIG(CT) OFF: LINE (20,191)-(240,191),1: COLOR 15: DRAW "BM70,99": IF TX<20 THEN PRINT#1, "   time out    ": GOTO 730
620 IF SA=0 THEN PRINT#1, "no more credits": GOTO 730
630 IF SY<99 THEN 620
640 FOR AT=0 TO 11: IF S(AT)=0 THEN 660
650 SOUND 6,31: SOUND 12,40: SOUND 13,0: FOR E3=0 TO 4: FOR E2=5 TO 7: SPRITE$(AT)=S$(E2): PUT SPRITE AT,(X(AT),Y(AT)),15,AT: NEXT E2: NEXT E3:SPRITE$(AT)=S$(7)
660 NEXT AT
670 XM=X: SPRITE$(14)=S$(8): IF X<127 THEN 690
680 FOR X=X TO -10 STEP -1: PUT SPRITE 14,(X,Y+6),15,14: FOR E3=0 TO 10: NEXT E3: NEXT X: GOTO 700
690 FOR X=X TO 255: PUT SPRITE 14,(X,Y+6),15,14: FOR E3=0 TO 10: NEXT E3: NEXT X
700 X=XM: SOUND 6,31: SOUND 12,40: SOUND 13,0: FOR E3=0 TO 25: FOR E2=5 TO 7: SPRITE$(P)=S$(E2): NEXT E2: NEXT E3: SPRITE$(P)=S$(7): Y=209
710 PUT SPRITE 14,(0,209),15,14: DRAW "BM70,99": PRINT #1,"   You win !  "

720 ' EINDE SPEL ********************
730 INTERVAL OFF: BY=0: GOSUB 430: STRIG(CT) OFF: DRAW "BM90,108"
740 COLOR 15: PRINT #1,"GAME OVER": DRAW "BM80,116": PRINT #1,"press return"
750 DC=0: AY=0: AF=0: S(AT)=1
760 A$=INPUT$(1): IF A$<>CHR$(13) THEN 760
770 GOSUB 940: GOTO 250

780 ' INITIALISATIE *****************
790 COLOR 15,12,4: SCREEN 2,2: CLS: DIMS$(20),S(15),X(15),Y(15)
800 DEFUSR0=&H41: B=USR0(0): DEFUSR1=&H44
810 RESTORE 1160: FOR J=0 TO 9: S$(J)=STRING$(32,32)
820 FOR I=1 TO 32: READ A
830 MID$(S$(J),I,1)=CHR$(A)
840 NEXT I: NEXT J
850 X=120: Y=172: Z=1: S=4: SD=0: B=1: P=12: BP=13: X1=255: Y1=185: ST=-2: N=37: SW=3
860 FOR I=0 TO 9: READ N$(I): NEXT I
870 ON STRIG GOSUB 300,300: ON ERROR GOTO 580
880 LINE (0,0)-(255,12),1,BF
890 LINE (0,13)-(255,13),15: LINE (0,188)-(255,192),1,BF: LINE (0,14)-(255,85),7,BF
900 OPEN "GRP:" FOR OUTPUT AS 1
910 DRAW "BM0,27": COLOR 4: PRINT #1,"      ----Alien attack----                                                by L.Dorsman                  a publication of                                              MSX-computer magazine": COLOR 15
920 DRAW "BM0,110":   :PRINT #1,"         Select control:                                                  1=keyboard                      2=joystick 1": B=USR1(0): BEEP
930 A$=INPUT$(1): CT=VAL(A$)-1: IF CT<0 OR CT>1 THEN 930

940 ' WARME START *******************
950 B=USR0(0): SPRITE$(P)=S$(0): SPRITE$(BP)=S$(8): Y=172
960 SPRITE$(0)=S$(1)
970 FOR I=1 TO 3: SPRITE$(I)=S$(2): NEXT I
980 FOR I=4 TO 11: SPRITE$(I)=S$(SW): NEXT I
990 X(0)=128: Y(0)=15: S(0)=1
1000 FOR I=1 TO 3: X(I)=108+(I-1)*20: Y(I)=34: S(I)=1: NEXT I
1010 FOR I=4 TO 7: X(I)=98+(I-4)*20: Y(I)=52: S(I)=1: NEXT I
1020 FOR I=8 TO 11: X(I)=98+(I-8)*20: Y(I)=70: S(I)=1: NEXT I
1030 LV=0: LINE (0,0)-(255,12),1,BF
1040 DRAW "BM11,3": PRINT #1,"score    credits     level"
1050 LINE (0,13)-(255,13),15: LINE (0,188)-(255,192),1,BF
1060 LINE (0,14)-(255,85),7,BF: LINE (0,86)-(255,187),12,BF
1070 LINE (55,1)-(72,11),6,BF: DRAW "BM57,2"
1080 DRAW N$(0): DRAW "BM64,2": DRAW N$(0)
1090 DRAW "BM144,2": DRAW N$(0): DRAW "BM151,2": DRAW N$(4)
1100 DRAW "BM144,2": DRAW N$(0): DRAW "BM151,2": DRAW N$(4)
1110 LINE (222,1)-(232,11),13,BF: DRAW "BM224,2": DRAW N$(1)
1120 DRAW "BM0,83": COLOR 12: PRINT#1, "timptmeqmaiatineiotiuttttroattie"
1130 PUT SPRITE P,(X,Y),15,P: TX=130: LINE (20,191)-(TX,191),15: TD=39: T%=60
1140 STRIG(CT) ON: COLOR 15: TM=0: TIME=0: SA=4: SY=0: N=37: ST=-2: LV=1: B=USR1(0): BEEP
1150 SOUND 7,199: SOUND 8,16: SOUND 9,0: SOUND 10,0: SOUND 11,100: RETURN

1160 DATA 0,0,0,0,1,1,1,1,3,1,5,5,13,13,29,29,128,128,128,128,192,192,192,192,224,192,208,208,216,216,220,220
1170 DATA 128,204,228,242,153,157,255,255,159,157,249,243,231,197,133,7,1,51,39,79,153,185,255,255,249,185,159,207,231,163,161,224
1180 DATA 120,125,61,29,13,5,7,15,29,61,61,121,115,2,1,0,143,223,222,92,88,80,112,120,92,222,222,207,231,160,192,128
1190 DATA 0,10,25,25,59,123,251,251,251,251,123,59,26,27,9,0,0,80,152,152,220,222,223,223,223,223,222,220,88,216,144,0
1200 DATA 10,25,57,59,107,235,235,203,203,235,235,107,58,58,27,9,80,152,156,220,214,215,215,211,211,215,215,214,92,92,216,144
1210 DATA 16,39,72,147,36,73,82,85,85,82,73,36,147,72,39,16,8,228,18,201,36,146,74,170,170,74,146,36,201,18,228,8
1220 DATA 15,16,39,72,147,164,169,170,170,169,164,147,72,39,16,15,240,8,228,18,201,37,149,85,85,149,37,201,18,228,8,240
1230 DATA 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
1240 DATA 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,128,128,128,128,128,128,128,0,0,0,0,0,0
1250 DATA 0,0,0,0,1,1,1,1,3,1,5,5,13,13,29,29,0,0,0,0,192,192,192,192,224,192,208,208,216,216,220,220
1260 DATA "BM+2,+0C15R2BR1BD1D2BD2D2BD1BL1L2BL1BU1U2BU2U2"
1270 DATA "BM+2,+0C15BR3BD1D2BD2D2"
1280 DATA "BM+2,+0C15R2BR1BD1D2BD1BL1L2BL1BD1D2BD1BR1R2"
1290 DATA "BM+2,+0C15R2BR1BD1D2BD2D2BD1BL1L2BL1BU3BU1BR1R2"
1300 DATA "BM+2,+0C15BR3BD1D2BD2D2BU3BL1L2BL1BU1U2"
1310 DATA "BM+2,+0C15BR3L2BL1BD1D2BD1BR1R2BR1BD1D2BD1BL1L2"
1320 DATA "BM+2,+0C15BR3L2BL1BD1D2BD1BR1R2BR1BD1D2BD1BL1L2BL1BU1U2"
1330 DATA "BM+2,+0C15R2BR1BD1D2BD2D2"
1340 DATA "BM+2,+0C15R2BR1BD1D2BD2D2BD1BL1L2BL1BU1U2BU2U2BD3BR1R2"
1350 DATA "BM+2,+0C15R2BR1BD1D2BD2D2BD1BL1L2BL1BU3BU2U2BD3BR1R2"