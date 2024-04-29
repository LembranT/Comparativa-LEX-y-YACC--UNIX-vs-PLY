import ply.lex as lex

# Llista de tokens
tokens = (
    'INTEGER',
    'PLUS',
    'MINUS',
    'PRINT',
    'SEMI',
)

# Definir tokens
t_PLUS = r'\+'
t_MINUS = r'-'
t_PRINT = r'PRINT'
t_SEMI = r';'
t_ignore = ' \t'

# Definir token INTEGER
def t_INTEGER(t):
    r'\d+'
    t.value = int(t.value)
    return t

# Gestió d'errors
def t_error(t):
    print("Illegal character '%s'" % t.value[0])
    t.lexer.skip(1)

# Construcció del lexer
lexer = lex.lex()
