%{
#include <stdio.h>
#include <stdlib.h>
%}

%token VALIDO NOVALIDO
%token END

%start Init
%%

Init: VALIDO {comprobar(yytext)} 
|  NOVALIDO{comprobar(yytext)}
| END;


%%

void comprobar(char c[])
{
    int i,min,may,sim,tam;
    min = 0;
    may = 0;
    sim = 0;
    tam = strlen(c);
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
        printf("error con el tamaño de la clave debe de estar entre 8 y 15 caracteres\n")
    }
}

int yyerror(char *s)
{
    printf("ERROR: %s\n",s);
    return 1;
}

int main(void)
{
    yyparse();
}
