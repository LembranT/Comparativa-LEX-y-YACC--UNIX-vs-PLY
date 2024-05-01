%{
#include <stdio.h>
%}

%union{int valor;}
%token <valor> PRINT PLUS MINUS INTEGER SEMI
%type <valor> program expr
%left PLUS MINUS
%left UMINUS

%%
    // # Definición de la gramática

program : PRINT expr SEMI 
        {
            fprintf(stdout, "Imprimir: %d\n", $2);
        }
        | error SEMI 
        {  
            fprintf(stderr, "Error\n");  
            yyerrok; 
        }
        ;

expr : expr PLUS expr { $$ = $1 + $3; }
     | expr MINUS expr { $$ = $1 - $3; }
     | MINUS expr %prec UMINUS { $$ = -$2; }
     | INTEGER { $$ = $1; }
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
