%{
#include "PasswordParser.y.h"
%}

digit           [0-9]
lowercase       [a-z]
uppercase       [A-Z]
symbol          [\=\*\-\_\.\@\&]
nonvalidsym     [\!\#\$\,\/\:\ˆ\(\)\{\}\’\"\;\%\+\?\<\>\‘\∼\º\¿\¡\á\é\í\ó\ú\ñ\Ñ]

%%

{digit}         return NUM;
{lowercase}     return LOW;
{uppercase}     return UPP;
{symbol}        return SYM;
{nonvalidsym}   { 
                    yyerror("Simbolo invalido");
                    return ERR_SYM;
                }

"\n"            return END;
