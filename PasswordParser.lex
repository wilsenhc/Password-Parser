%{
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>
#include "PasswordParser.tab.h"
%}

minuscula   [a-z]
mayuscula   [A-Z]
numero      [0-9]
simbolo     [\=\*\-\_\.\@\&]
nosimbolo   [\!\#\$\,\/\\\:\ˆ\(\)\{\}\’\"\;\%\+\?\<\>\‘\∼\º\¿\¡\á\é\í\ó\ú\ñ\Ñ]
linea       [\n]

%%
 
{minuscula}     {
                    yylval.cad = *yytext;
                    return MIN;
                }
{mayuscula}     {
                    yylval.cad = *yytext;
                    return MAYUS;
                }
{numero}        {
                    yylval.cad = *yytext;
                    return NUM;
                }
{simbolo}       {
                    yylval.cad = *yytext;
                    return SIMB;
                }
{linea}         return END;
{nosimbolo}     {
                    yylval.cad = *yytext; 
                    return NOVALIDO;
                }

%%
