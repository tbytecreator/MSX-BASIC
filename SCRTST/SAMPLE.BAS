5 ' Example for MSX2 and higher
10 SCREEN 0: PRINT"You are in SCREEN 0 - Press a key"
20 A$=INKEY$
30 IF A$="" THEN 20
40 ' Baud and printertype are not changed
50 SCREEN 2,3,0,,,1
60 OPEN"GRP:"AS 1:PRINT #1,"You are in SCREEN 2 - Press a key"
70 A$=INKEY$
80 IF A$="" THEN 70
90 ' Back to default values in SCREEN 0
100 SCREEN 0,0,1,,,0