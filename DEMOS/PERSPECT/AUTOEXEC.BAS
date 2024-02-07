10 ' Perspectivas Tri-Dimensionais
20 FOR F=1 TO 8:KEY(F)ON:NEXT F
30 N%=16:COLOR 1,9,8:SCREEN2
40 DIM I(N%),X(N%),Y(N%),Z(N%)
50 DIM S(N%),T(N%):J%=5:K%=1:E%=100
60 S=SIN(.2):C=COS(.2)
70 FOR F%=1 TO N%
80 READ I(F%),X(F%),Y(F%),Z(F%)
90 Z(F%)=-Z(F%):NEXT F%
100 FOR F%=1 TO N%
110 S(F%)=120+X(F%)*E%/(K%*Z(F%)+J%)
120 T(F%)=86-Y(F%)*E%/(K%*Z(F%)+J%)
130 NEXT F%:CLS
140 FOR F%=1 TO N%
150 IF I(F%)=0 THEN PSET(S(F%),T(F%))
160 IF I(F%)=1 THEN LINE(S(F%),T(F%))-(S(F%-1),T(F%-1))
170 NEXT F%
180 ON KEY GOSUB 200,270,340,410,480,500,520,540
190 GOTO 180
200 ' Gira a frente para a direita
210 FOR F%=1 TO N%
220 X=X(F%)*C-Z(F%)*S
230 Z=Z(F%)*C+X(F%)*S
240 X(F%)=X:Z(F%)=Z
250 NEXT F%
260 RETURN 100
270 ' Gira a frente para a esquerda
280 FOR F%=1 TO N%
290 X=X(F%)*C+Z(F%)*S
300 Z=Z(F%)*C-X(F%)*S
310 X(F%)=X:Z(F%)=Z
320 NEXT F%
330 RETURN 100
340' Gira a frente para baixo
350 FOR F%=1 TO N%
360 Y=Y(F%)*C+Z(F%)*S
370 Z=Z(F%)*C-Y(F%)*S
380 Y(F%)=Y:Z(F%)=Z
390 NEXT F%
400 RETURN 100
410 ' Gira a frente para cima
420 FOR F%=1 TO N%
430 Y=Y(F%)*C-Z(F%)*S
440 Z=Z(F%)*C+Y(F%)*S
450 Y(F%)=Y:Z(F%)=Z
460 NEXT F%
470 RETURN 100
480 ' Afasta
490 J%=J%*2:RETURN 100
500 ' Aproxima
510 J%=J%/2:RETURN 100
520 ' Aumenta a perspect iva
530 K%=K%*2:RETURN 100
540 ' Diminui a perspectiva
550 K%=K%/2:RETURN 100
560 ' Dados =>(p/t,x,y,z)
570 DATA 0,1,1,1
580 DATA 1,1,1,-1
590 DATA 1,1,-1,-1
600 DATA 1,1,-1,1
610 DATA 1,1,1,1
620 DATA 1,-1,1,1
630 DATA 1,-1,1,-1
640 DATA 1,-1,-1,-1
650 DATA 1,-1,-1,1
660 DATA 1,-1,1,1
670 DATA 0,-1,-1,-1
680 DATA 1,1,-1,-1
690 DATA 0,-1,-1,1
700 DATA 1,1,-1,1
720 DATA 0,-1,1,-1
730 DATA 1,1,1,-1
