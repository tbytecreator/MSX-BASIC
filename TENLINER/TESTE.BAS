10 ' Init the game here... For example:
20 DEFINT A-Z
30 X=128:Y=96
40 FORI=2TO8:XD(I)=SGN(5-I):YD(8-I)=XD(I):NEXT:SWAPYD(0),YD(8)
50 SCREEN2,1:SPRITE$(0)="0HH0"

100 ' Reset time counter
110 TIME=0

120 ' Main loop: Do joystick checks, game logic, 
130 ' exception handling etc. here... For example:
140 S=STICK(J)
150 X=X+XD(S):Y=Y+YD(S)
160 IF X<0 THEN X=0
170 IF Y<0 THEN Y=0
180 IF X>255 THEN X=255
190 IF Y>191 THEN Y=191

200 ' Sync to time
210 IF TIME<5 THEN 210 ELSE TIME=0
220 ' Update the screen
230 PUTSPRITE0,(X,Y),8
240 ' Repeat the main loop
250 GOTO 120