%{
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <ctype.h>
#include <string.h>

 void yyerror(char s[]);
 extern int yylex(void);
 void comprobar(char* c);

 char cadena[200];
 int indice = 0;

%}

%union {
    char cad;
}
%token<cad> MIN MAYUS NUM SIMB NOVALIDO EMPTY
%token<cad> END
%start Password


%%

Password: NUM Password { cadena[indice] = $1; indice++; printf("\n\n\nLa cadena de texto es : %s y el indice es %d\n\n\n", cadena, indice);}
| MIN Password  { cadena[indice] = $1; indice++; printf("\n\n\nLa cadena de texto es : %s y el indice es %d\n\n\n", cadena, indice); }
| MAYUS Password  { cadena[indice] = $1; indice++; printf("\n\n\nLa cadena de texto es : %s y el indice es %d\n\n\n", cadena, indice);}
| SIMB Password  { cadena[indice] = $1; indice++; printf("\n\n\nLa cadena de texto es : %s y el indice es %d\n\n\n", cadena, indice); }
| NOVALIDO Password  { cadena[indice] = $1; indice++;  printf("\n\n\nLa cadena de texto es : %s y el indice es %d\n\n\n", cadena, indice);}
| END {}
| NUM {cadena[indice] = $1; indice++; printf("\n\n\nLa cadena de texto es : %s y el indice es %d\n\n\n", cadena, indice);}
| MAYUS {cadena[indice] = $1; indice++; printf("\n\n\nLa cadena de texto es : %s y el indice es %d\n\n\n", cadena, indice);}
| SIMB {cadena[indice] = $1; indice++; printf("\n\n\nLa cadena de texto es : %s y el indice es %d\n\n\n", cadena, indice);}
| NOVALIDO {cadena[indice] = $1; indice++; printf("\n\n\nLa cadena de texto es : %s y el indice es %d\n\n\n", cadena, indice);}
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

void comprobar(char* c)
{
    int i,min,may,sim,tam;
    min = 0;
    may = 0;
    sim = 0;
    tam = strlen(c);
    printf("tam = %d y la cadena es = %s",tam,c);
    checkLength(c);  

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


//validpass: valido NUM valido MIN valido MAYUS valido SIMB valido {strcpy(cadena,$1); strcat(cadena,$2); strcat(cadena,$3); strcat(cadena,$4); strcat(cadena,$5); strcat(cadena,$6); strcat(cadena,$7);strcat(cadena,$8);strcat(cadena,$9);};
