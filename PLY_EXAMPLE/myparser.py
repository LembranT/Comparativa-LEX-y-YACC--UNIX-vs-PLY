import ply.yacc as yacc
from mylexer import tokens

# Definició de la gramàtica

def p_statement_print(p):
    'statement : PRINT expr SEMI'

    print("Imprimir:", p[2])

def p_expr(p):
    '''expr : expr PLUS expr
            | expr MINUS expr
            | INTEGER'''
    
    if len(p) == 4:
        if p[2] == '+':
            p[0] = p[1] + p[3]
        elif p[2] == '-':
            p[0] = p[1] - p[3]
    else:
        p[0] = p[1]

def p_error(p):
    print("Syntax error in input!")

# Construcción del parser
parser = yacc.yacc()

