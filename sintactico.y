%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

 void yyerror(char s[]);
 extern int yylex(void);


%}

%token VALIDO NOVALIDO
%token VALIDO1
%token VALIDO2
%token VALIDO3
%token VALIDO4
%token VALIDO5
%token VALIDO6
%token VALIDO7
%token VALIDO8
%token VALIDO9
%token VALIDO10
%token VALIDO11
%token VALIDO12
%token VALIDO13
%token VALIDO14
%token VALIDO15
%token VALIDO16
%token VALIDO17
%token VALIDO18
%token VALIDO19
%token VALIDO20
%token VALIDO21
%token VALIDO22
%token VALIDO23
%token END

%start Init
%%

Init: VALIDO {} 
|  NOVALIDO{}
| END;


%%

void yyerror(char s[])
{
    printf("ERROR: %s\n",s);
}
