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

%%

 /**********REGLAS**********/
 
{minuscula} { strcpy(yylval.cad,yytext); return MIN; }
{mayuscula} {strcpy(yylval.cad,yytext); return MAYUS;}
{numero} {strcpy(yylval.cad,yytext); return NUM;}
{simbolo} {strcpy(yylval.cad,yytext); return SIMB;}
{linea} {return END;}
. { strcpy(yylval.cad,yytext); return NOVALIDO;}
              
%%

int main()
{
    yyparse();

    return 0;
}