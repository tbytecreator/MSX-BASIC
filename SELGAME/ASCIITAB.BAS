010 '***************************
020 ' TABELA ASCII              
040 ' MANOEL NETO               
050 ' 2023-04-29                
060 '***************************
070 SCREEN 0:KEY OFF:WIDTH 40
075 CLS 
080 FOR I = 32 TO 255
090   IF I < 100 THEN PRINT"0";
100   PRINT I;CHR$(I);" "; 
110 NEXT I
120 END