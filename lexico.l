/*******DEFINICIONES********/

%{
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>
#include "sintactico.tab.h"

void comprobar(char c[]);
void tamano(char c[]);

%}

minuscula [a-z]+
mayuscula [A-Z]+
numero [0-9]+
simbolo [=*-_.@&]+
nosimbolo [!#$,/\:ˆ(){}’";%+?<>‘∼º¿¡áéíóúñÑ]+
linea [\n]

%%

 /**********REGLAS**********/
 
{minuscula} { strcpy(yylval,yytext); return MIN; }
{mayuscula} {strcpy(yylval,yytext); return MAYUS;}
{numero} {strcpy(yylval,yytext); return NUM;}
{simbolo} {strcpy(yylval,yytext); return SIMB;}
{linea} {return END;}
. { strcpy(yylval,yytext); return NOVALIDO;}
              
%%

void comprobar(char c[])
{
    int i,min,may,sim,tam;
    min = 0;
    may = 0;
    sim = 0;
    tam = strlen(c);
    printf("tam = %d y la cadena es = %s",tam,c);
    tamano(c);  

    for(i = 0; i < tam ; i++)
    {
        if(c[i] >= 'a' && c[i] <= 'z')
        {
            min++;
        }
        if(c[i] >= 'A' && c[i] <= 'Z')
        {
            may++;
        }
        if(c[i] == '=' ||c[i] == '*' ||c[i] == '-' ||c[i] == '_' ||c[i] == '.' ||c[i] == '@' ||c[i] == '&' )
        {
            sim++;
        }
    }
    if(!min)
    {
        printf("\nLa clave debe de tener por lo menos una letras minuscula\n");
    }
    if(!may)
    {
        printf("\nLa clave debe de tener por lo menos una letras mayuscula\n");
    }
    if(!sim)
    {
        printf("\nLa clave debe de tener por lo menos un simbolo especial valido\n");
    }
}

void tamano(char c[])
{
    int tam;

    tam = strlen(c);

    if(tam < 8 || tam > 15)
    {
        printf("error con el tamaño de la clave debe de estar entre 8 y 15 caracteres\n");
    }
}

int main()
{
    yyparse();

    return 0;
}