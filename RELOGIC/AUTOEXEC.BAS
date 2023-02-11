010 DEFINT A-Z:SCREEN 0:WIDTH 40:KEY OFF:CLS
020 ?"================================"
030 ?"EXEMPLOS DE OPERADORES          " 
040 ?"================================" 
050 ?"QUE OPERADORES DESEJA ESTUDAR?  "
060 ?"(L)OGICOS                       "
070 ?"(R)ELACIONAIS                   "
080 ?"================================"
090 OP$=INPUT$(1)
100 IF OP$="L" OR OP$="l" THEN GOSUB 1000
110 IF OP$="R" OR OP$="r" THEN GOSUB 2000
120 GOTO 10
1000 ?"================================"
1010 ?"EXEMPLOS DE OPERADORES          " 
1020 ?"LOGICOS                         "
1030 ?"================================"
1040 OP$=INPUT$(1) 
1050 RETURN
2000 ?"================================"
2010 ?"EXEMPLOS DE OPERADORES          " 
2020 ?"RELACIONAIS                     "
2030 ?"================================" 
2040 INPUT "ENTRE UM VALOR PARA A";A
2050 INPUT "ENTRE UM VALOR PARA B";B
2060 ?"================================"
2070 ?"A E IGUAL A B         ?";A=B 
2080 ?"A E DIFERENTE DE B    ?";A<>B
2090 ?"A E MENOR QUE B       ?";A<B 
2100 ?"A E MAIOR QUE B       ?";A>B 
2110 ?"A E MENOR OU IGUAL A B?";A<=B
2120 ?"A E MAIOR OU IGUAL A B?";A>=B
2130 ?"================================"
2140 OP$=INPUT$(1)
2150 RETURN