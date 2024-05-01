%{
#include "example.tab.h"
%}

%option nounput
%option noinput
%option noyywrap

DIGIT           [0-9]
WHITE_SPACE     [ \t]

%%

{WHITE_SPACE}+ 

{DIGIT}+   { 
                yylval.valor = atoi(yytext);
                return INTEGER;
            }

"+"         { 
                return PLUS;
            }

"-"         { 
                return MINUS;
            }

"PRINT"     { 
                return PRINT;
            }

";"         {   
                return SEMI;
            }

.           {
                // Gestió d'errors
                printf("Illegal character '%c'\n", yytext[0]);
            }
%%

