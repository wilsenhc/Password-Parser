/*******DEFINICIONES********/

%{
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>
#include "sintactico.tab.h"

%}

minuscula [a-z]+
mayuscula [A-Z]+
numero [0-9]+
simbolo [=*-_.@&]+
nosimbolo [!#$,/\:ˆ(){}’";%+?<>‘∼º¿¡áéíóúñÑ]+
linea [\n]
%array

%%

 /**********REGLAS**********/
 
{minuscula} {strcpy(yylval.cad,yytext); printf("\n\n\n\nLLEGO HASTA MIN : %s\n\n\n\n",yylval.cad);  return MIN; }
{mayuscula} {strcpy(yylval.cad,yytext); printf("\n\n\n\nLLEGO HASTA MAYUS : %s\n\n\n\n",yylval.cad); return MAYUS;}
{numero} {strcpy(yylval.cad,yytext); printf("\n\n\n\nLLEGO HASTA NUM : %s\n\n\n\n",yylval.cad); return NUM;}
{simbolo} {strcpy(yylval.cad,yytext);printf("\n\n\n\nLLEGO HASTA SIMB : %s\n\n\n\n",yylval.cad); return SIMB;}
{linea} {return END; printf("\n\n\n\nLLEGO HASTA END\n\n\n\n");}
. { strcpy(yylval.cad,yytext); return NOVALIDO;}
              
%%

int main()
{
    yyparse();

    return 0;
}