%{
#include <stdio.h>
%}

%union{int valor;}
%token <valor> PRINT PLUS MINUS INTEGER SEMI
%type <valor> program expr
%left PLUS MINUS

%%
    // # Definició de la gramàtica

program : PRINT expr SEMI
        {
            printf("Imprimir: %d\n", $2);
        }
        ;

expr : expr PLUS expr
     {
         $$ = $1 + $3;
     }
     | expr MINUS expr
     {
         $$ = $1 - $3;
     }
     | INTEGER
     {
         $$ = $1;
     }
     ;

%%

int yylex();

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main() {
    yyparse();
    return 0;
}
