%{
#include <stdio.h>
#include <stdlib.h>
%}

%token NUM LOW UPP SYM
%token ERR_SYM
%token END

%start Init
%%

Init: ;

%%

int yyerror(char *s)
{
    printf("ERROR: %s\n",s);
    return 1;
}

int main(void)
{
    yyparse();
}
