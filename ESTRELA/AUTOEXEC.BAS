01 ' DRAW THE CHRISTMAS STAR CHALLENGE
02 ' MANOEL NETO 2022-12-15 
03 ' ======================================
10 SCREEN 0:KEY OFF:CLS:DEFINT A-Z:WIDTH 40
20 GOSUB 300 : ' PLAY SONG
30 FOR I = 1 TO 19
40   READ NS
50   IF NS<11 THEN GOSUB 100 : ' DRAW POINTS
60   IF NS>10 THEN GOSUB 200 : ' DRAW CENTER
70 NEXT I  
80 LOCATE 12,21:?"MERRY CHRISTMAS!"
90 GOTO 90
100 ' DRAW POINTS
110 XL=14
120 XR=24
130 FOR J = 1 TO NS
140   IF J MOD 2=0 THEN XR=XR-1:LOCATE XR,I:?"*" ELSE XL=XL+1:LOCATE XL,I:?"*"
150 NEXT J
160 RETURN
200 ' DRAW CENTER 
210 XM=19
220 CL = 0
230 CR = 0 
240 FOR K = 1 TO NS
250   IF K MOD 2 = 0 THEN LOCATE XM-CL,I:?"*":CL=CL+1 ELSE LOCATE XM+CR,I:?"*":CR=CR+1 
260 NEXT K
270 RETURN
300 ' PLAY CHRISTMAS SONG 
310 A$="T140V12o4cf8r8f8g8f8e8d8r8d8r8dg8r8g8a8g8f8e8r8eca8r8a8b-8a8g8f8r8fd16r16d8cft126ee8f2"
320 PLAY A$
330 RETURN 
1000 DATA 2,4,6,8,10,20,18,16,14,12,14,16,18,20,10,8,6,4,2