/*******DEFINICIONES********/

%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "PasswordParser.y.h"

%}

minuscula [a-z]+
mayuscula [A-Z]+
numero [0-9]+
simbolo [=*-_.@&]+
nosimbolo [!#$,/\:ˆ(){}’";%+?<>‘∼º¿¡áéíóúñÑ]+
clave1 {{minuscula}{mayuscula}{numero}{simbolo}}
clave2 {{minuscula}{mayuscula}{simbolo}{numero}}
clave3 {{minuscula}{numero}{simbolo}{mayuscula}}
clave4 {{minuscula}{numero}{mayuscula}{simbolo}}
clave5 {{minuscula}{simbolo}{mayuscula}{numero}}
clave6 {{minuscula}{simbolo}{numero}{mayuscula}}
clave7 {{mayuscula}{minuscula}{numero}{simbolo}}
clave8 {{mayuscula}{minuscula}{simbolo}{numero}}
clave9 {{mayuscula}{numero}{minuscula}{simbolo}}
clave10 {{mayuscula}{numero}{simbolo}{minuscula}}
clave11 {{mayuscula}{simbolo}{minuscula}{numero}}
clave12 {{mayuscula}{simbolo}{numero}{minuscula}}
clave13 {{numero}{simbolo}{minuscula}{mayuscula}}
clave14 {{numero}{simbolo}{mayuscula}{minuscula}}
clave15 {{numero}{minuscula}{mayuscula}{simbolo}}
clave16 {{numero}{minuscula}{simbolo}{mayuscula}}
clave17 {{numero}{mayuscula}{minuscula}{simbolo}}
clave18 {{numero}{mayuscula}{simbolo}{minuscula}}
clave19 {{simbolo}{minuscula}{mayuscula}{numero}}
clave20 {{simbolo}{minuscula}{numero}{mayuscula}}
clave21 {{simbolo}{numero}{minuscula}{mayuscula}}
clave22 {{simbolo}{numero}{minuscula}{mayuscula}}
clave23 {{simbolo}{mayuscula}{minuscula}{numero}}
clave24 {{simbolo}{mayuscula}{numero}{minuscula}}
%array

%%

 /**********REGLAS**********/

{clave1} {return VALIDO};
{clave2} {return VALIDO};
{clave3} {return VALIDO};
{clave4} {return VALIDO};
{clave5} {return VALIDO};
{clave6} {return VALIDO};
{clave7} {return VALIDO};
{clave8} {return VALIDO};
{clave9} {return VALIDO};
{clave10} {return VALIDO};
{clave11} {return VALIDO};
{clave12} {return VALIDO};
{clave13} {return VALIDO};
{clave14} {return VALIDO};
{clave15} {return VALIDO};
{clave16} {return VALIDO};
{clave17} {return VALIDO};
{clave18} {return VALIDO};
{clave19} {return VALIDO};
{clave20} {return VALIDO};
{clave21} {return VALIDO};
{clave22} {return VALIDO};
{clave23} {return VALIDO};
{clave24} {return VALIDO};
"\n"            return END;
. { yyerror("Simbolo invalido");
              return NOVALIDO;}
              
%%