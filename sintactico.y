%{
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <ctype.h>
#include <string.h>

 void yyerror(char s[]);
 extern int yylex(void);
 void comprobar(char c[]);
 void inicializar(char c[]);

 char cadena[200] = {'\0'};
 int indice = 0;
 int band = 0;

%}

%union {
    char cad;
}
%token<cad> MIN MAYUS NUM SIMB NOVALIDO EMPTY END
%start inicio


%%

inicio: 
| Password {comprobar(cadena); inicializar(cadena); indice = 0;} inicio
;

Password: NUM Password { cadena[indice] = $1; indice++; }
| MIN Password { cadena[indice] = $1; indice++;}
| MAYUS Password { cadena[indice] = $1; indice++;}
| SIMB Password { cadena[indice] = $1; indice++;}
| NOVALIDO Password { cadena[indice] = $1; indice++; band++;}
| END
;


%%

void yyerror(char s[])
{
    printf("ERROR: %s\n",s);
}
void inicializar(char c[])
{
    memset(c,'\0',199);
}

 void comprobar(char c[])
{
    int i,min,may,sim,tam,num;
    num = 0;
    min = 0;
    may = 0;
    sim = 0;
    tam = strlen(c);
    printf("\ntam = %d y la cadena es = %s\n",tam,c);
    if(tam < 8 || tam > 15)
    {
        printf("\nLa longitud de la contraseña tiene que estar entre 8 y 15 carateres\n");
    }  

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
        if(c[i] >= '0' && c[i] <= '9')
        {
            num++;
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
    if(!num)
    {
        printf("\nLa clave debe de tener por lo menos un numero\n");
    }
    if(band)
    {
        printf("\nLA clave no puede tener simbolos no validos\n");
    }
    if(min && may && sim && num && !band)
    {
        printf("\nclave aceptada\n");
    }
    band = 0;
}
int main()
{
    yyparse();

    return 0;
}