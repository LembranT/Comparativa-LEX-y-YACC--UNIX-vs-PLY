#ifndef _yy_defines_h_
#define _yy_defines_h_

#define PRINT 257
#define PLUS 258
#define MINUS 259
#define INTEGER 260
#define SEMI 261
#define UMINUS 262
#ifdef YYSTYPE
#undef  YYSTYPE_IS_DECLARED
#define YYSTYPE_IS_DECLARED 1
#endif
#ifndef YYSTYPE_IS_DECLARED
#define YYSTYPE_IS_DECLARED 1
typedef union YYSTYPE{int valor;} YYSTYPE;
#endif /* !YYSTYPE_IS_DECLARED */
extern YYSTYPE yylval;

#endif /* _yy_defines_h_ */
