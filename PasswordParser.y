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
    | Password  {
                    comprobar(cadena); 
                    inicializar(cadena); 
                    indice = 0;
                } inicio ;

Password: 
    NUM Password        {
                            cadena[indice] = $1; 
                            indice++; 
                        }
    | MIN Password      {
                            cadena[indice] = $1;
                            indice++;
                        }
    | MAYUS Password    {
                            cadena[indice] = $1;
                            indice++;}
    | SIMB Password     {
                            cadena[indice] = $1;
                            indice++;
                        }
    | NOVALIDO Password {
                            cadena[indice] = $1; 
                            indice++; 
                            band++;
                        }
    | END ;


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
    int i;
    int num = 0;
    int min = 0;
    int may = 0;
    int sim = 0;
    int tam = strlen(c);

    if (tam < 8 || tam > 15)
    {
        printf("La longitud de la contraseña tiene que estar entre 8 y 15 carateres\n");
    }  

    for (i = 0; i < tam ; i++)
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
        printf("* La contraseña debe de tener por lo menos una letra minuscula.\n");
    }

    if(!may)
    {
        printf("* La contraseña debe de tener por lo menos una letra mayuscula.\n");
    }

    if(!sim)
    {
        printf("* La contraseña debe de tener por lo menos un simbolo especial valido (=*-_.@&).\n");
    }

    if(!num)
    {
        printf("* La contraseña debe de tener por lo menos un numero.\n");
    }

    if(band)
    {
        printf("* La contraseña debe contener solamente los siguientes simbolos (=*-_.@&).\n");
    }

    if(min && may && sim && num && !band)
    {
        printf("* Contraseña aceptada\n");
    }

    band = 0;

    printf("\n");
}

int main()
{
    yyparse();

    return 0;
}
