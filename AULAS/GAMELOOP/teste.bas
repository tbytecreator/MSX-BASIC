10 SCREEN 2
20 COLOR 15, 0
30 CLS
40 PRINT "Bem-vindo ao gameloop!"
50 PRINT "Pressione ESC para sair."
60 DO
70   ' Lógica do jogo aqui
80   ' Atualizações de tela aqui
90   ' Entrada do jogador aqui
100  IF INKEY$ = CHR$(27) THEN EXIT DO
110 LOOP
120 PRINT "Obrigado por jogar!"
130 SCREEN 0
140 COLOR 7, 0
150 CLS
160 END