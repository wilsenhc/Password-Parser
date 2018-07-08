%{
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <ctype.h>
#include <string.h>

 void yyerror(char s[]);
 extern int yylex(void);

 char *cadena;


%}

%define api.value.type {char*}
%token<char*> MIN MAYUS NUM SIMB NOVALIDO EMPTY
%token<char> END
%type <char*> Password ValidPassword
%start Password


%%

Password: ValidPassword END { printf("\n\n\nesta es la cadena: %s\n\n\n",*$1); checkLength($1); } ;

ValidPassword: ValidPassword NUM ValidPassword MIN ValidPassword MAYUS ValidPassword SIMB ValidPassword {strcpy(cadena,$1); strcat(cadena,$2); strcat(cadena,$3); strcat(cadena,$4); strcat(cadena,$5); strcat(cadena,$6); strcat(cadena,$7);strcat(cadena,$8);strcat(cadena,$9);} 
| ValidPassword NUM ValidPassword MIN ValidPassword SIMB ValidPassword MAYUS ValidPassword {strcpy(cadena,$1); strcat(cadena,$2); strcat(cadena,$3); strcat(cadena,$4); strcat(cadena,$5); strcat(cadena,$6); strcat(cadena,$7);strcat(cadena,$8);strcat(cadena,$9);} 
| ValidPassword NUM ValidPassword SIMB ValidPassword MAYUS ValidPassword MIN ValidPassword {strcpy(cadena,$1); strcat(cadena,$2); strcat(cadena,$3); strcat(cadena,$4); strcat(cadena,$5); strcat(cadena,$6); strcat(cadena,$7);strcat(cadena,$8);strcat(cadena,$9);}
| ValidPassword NUM ValidPassword SIMB ValidPassword MIN ValidPassword MAYUS ValidPassword {strcpy(cadena,$1); strcat(cadena,$2); strcat(cadena,$3); strcat(cadena,$4); strcat(cadena,$5); strcat(cadena,$6); strcat(cadena,$7);strcat(cadena,$8);strcat(cadena,$9);}
| ValidPassword NUM ValidPassword MAYUS ValidPassword MIN ValidPassword SIMB ValidPassword {strcpy(cadena,$1); strcat(cadena,$2); strcat(cadena,$3); strcat(cadena,$4); strcat(cadena,$5); strcat(cadena,$6); strcat(cadena,$7);strcat(cadena,$8);strcat(cadena,$9);}
| ValidPassword NUM ValidPassword MAYUS ValidPassword SIMB ValidPassword MIN ValidPassword {strcpy(cadena,$1); strcat(cadena,$2); strcat(cadena,$3); strcat(cadena,$4); strcat(cadena,$5); strcat(cadena,$6); strcat(cadena,$7);strcat(cadena,$8);strcat(cadena,$9);}

| ValidPassword MIN ValidPassword NUM ValidPassword MAYUS ValidPassword SIMB ValidPassword {strcpy(cadena,$1); strcat(cadena,$2); strcat(cadena,$3); strcat(cadena,$4); strcat(cadena,$5); strcat(cadena,$6); strcat(cadena,$7);strcat(cadena,$8);strcat(cadena,$9);}
| ValidPassword MIN ValidPassword NUM ValidPassword SIMB ValidPassword MAYUS ValidPassword {strcpy(cadena,$1); strcat(cadena,$2); strcat(cadena,$3); strcat(cadena,$4); strcat(cadena,$5); strcat(cadena,$6); strcat(cadena,$7);strcat(cadena,$8);strcat(cadena,$9);}
| ValidPassword MIN ValidPassword MAYUS ValidPassword NUM ValidPassword SIMB ValidPassword {strcpy(cadena,$1); strcat(cadena,$2); strcat(cadena,$3); strcat(cadena,$4); strcat(cadena,$5); strcat(cadena,$6); strcat(cadena,$7);strcat(cadena,$8);strcat(cadena,$9);}
| ValidPassword MIN ValidPassword MAYUS ValidPassword SIMB ValidPassword NUM ValidPassword {strcpy(cadena,$1); strcat(cadena,$2); strcat(cadena,$3); strcat(cadena,$4); strcat(cadena,$5); strcat(cadena,$6); strcat(cadena,$7);strcat(cadena,$8);strcat(cadena,$9);}
| ValidPassword MIN ValidPassword SIMB ValidPassword MAYUS ValidPassword NUM ValidPassword {strcpy(cadena,$1); strcat(cadena,$2); strcat(cadena,$3); strcat(cadena,$4); strcat(cadena,$5); strcat(cadena,$6); strcat(cadena,$7);strcat(cadena,$8);strcat(cadena,$9);}
| ValidPassword MIN ValidPassword SIMB ValidPassword NUM ValidPassword MAYUS ValidPassword {strcpy(cadena,$1); strcat(cadena,$2); strcat(cadena,$3); strcat(cadena,$4); strcat(cadena,$5); strcat(cadena,$6); strcat(cadena,$7);strcat(cadena,$8);strcat(cadena,$9);}

| ValidPassword MAYUS ValidPassword MIN ValidPassword NUM ValidPassword SIMB ValidPassword {strcpy(cadena,$1); strcat(cadena,$2); strcat(cadena,$3); strcat(cadena,$4); strcat(cadena,$5); strcat(cadena,$6); strcat(cadena,$7);strcat(cadena,$8);strcat(cadena,$9);}
| ValidPassword MAYUS ValidPassword MIN ValidPassword SIMB ValidPassword NUM ValidPassword {strcpy(cadena,$1); strcat(cadena,$2); strcat(cadena,$3); strcat(cadena,$4); strcat(cadena,$5); strcat(cadena,$6); strcat(cadena,$7);strcat(cadena,$8);strcat(cadena,$9);}
| ValidPassword MAYUS ValidPassword NUM ValidPassword MIN ValidPassword SIMB ValidPassword {strcpy(cadena,$1); strcat(cadena,$2); strcat(cadena,$3); strcat(cadena,$4); strcat(cadena,$5); strcat(cadena,$6); strcat(cadena,$7);strcat(cadena,$8);strcat(cadena,$9);}
| ValidPassword MAYUS ValidPassword NUM ValidPassword SIMB ValidPassword MIN ValidPassword {strcpy(cadena,$1); strcat(cadena,$2); strcat(cadena,$3); strcat(cadena,$4); strcat(cadena,$5); strcat(cadena,$6); strcat(cadena,$7);strcat(cadena,$8);strcat(cadena,$9);}
| ValidPassword MAYUS ValidPassword SIMB ValidPassword MIN ValidPassword NUM ValidPassword {strcpy(cadena,$1); strcat(cadena,$2); strcat(cadena,$3); strcat(cadena,$4); strcat(cadena,$5); strcat(cadena,$6); strcat(cadena,$7);strcat(cadena,$8);strcat(cadena,$9);}
| ValidPassword MAYUS ValidPassword SIMB ValidPassword NUM ValidPassword MIN ValidPassword {strcpy(cadena,$1); strcat(cadena,$2); strcat(cadena,$3); strcat(cadena,$4); strcat(cadena,$5); strcat(cadena,$6); strcat(cadena,$7);strcat(cadena,$8);strcat(cadena,$9);}

| ValidPassword SIMB ValidPassword MIN ValidPassword MAYUS ValidPassword NUM ValidPassword {strcpy(cadena,$1); strcat(cadena,$2); strcat(cadena,$3); strcat(cadena,$4); strcat(cadena,$5); strcat(cadena,$6); strcat(cadena,$7);strcat(cadena,$8);strcat(cadena,$9);}
| ValidPassword SIMB ValidPassword MIN ValidPassword NUM ValidPassword MAYUS ValidPassword {strcpy(cadena,$1); strcat(cadena,$2); strcat(cadena,$3); strcat(cadena,$4); strcat(cadena,$5); strcat(cadena,$6); strcat(cadena,$7);strcat(cadena,$8);strcat(cadena,$9);}
| ValidPassword SIMB ValidPassword NUM ValidPassword MAYUS ValidPassword MIN ValidPassword {strcpy(cadena,$1); strcat(cadena,$2); strcat(cadena,$3); strcat(cadena,$4); strcat(cadena,$5); strcat(cadena,$6); strcat(cadena,$7);strcat(cadena,$8);strcat(cadena,$9);}
| ValidPassword SIMB ValidPassword NUM ValidPassword MIN ValidPassword MAYUS ValidPassword {strcpy(cadena,$1); strcat(cadena,$2); strcat(cadena,$3); strcat(cadena,$4); strcat(cadena,$5); strcat(cadena,$6); strcat(cadena,$7);strcat(cadena,$8);strcat(cadena,$9);}
| ValidPassword SIMB ValidPassword MAYUS ValidPassword NUM ValidPassword MIN ValidPassword {strcpy(cadena,$1); strcat(cadena,$2); strcat(cadena,$3); strcat(cadena,$4); strcat(cadena,$5); strcat(cadena,$6); strcat(cadena,$7);strcat(cadena,$8);strcat(cadena,$9);}
| ValidPassword SIMB ValidPassword MAYUS ValidPassword MIN ValidPassword NUM ValidPassword {strcpy(cadena,$1); strcat(cadena,$2); strcat(cadena,$3); strcat(cadena,$4); strcat(cadena,$5); strcat(cadena,$6); strcat(cadena,$7);strcat(cadena,$8);strcat(cadena,$9);}

| NUM 
| MIN 
| MAYUS 
| SIMB
;

%%

void yyerror(char s[])
{
    printf("ERROR: %s\n",s);
}

void checkLength(char* str)
{
    int len = strlen(str);
    if(!(len < 8 || len > 15))
    {
        printf("\nLa longitud de la contraseña tiene que estar entre 8 y 15 carateres\n");
    }
    
}
