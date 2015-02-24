%{
#include "y.tab.h"
#include<string.h>
#include<math.h>
%}

NUMBER [0-9]+|([0-9]*"."[0-9]+)
ID [A-Za-z][A-Za-z0-9]*

%%
{NUMBER} {strcpy(yylval.t,yytext); return NUMBER;}
{ID} {strcpy(yylval.t,yytext); return ID;}
[\t]+ ;
[\+\-\*\/] {strcpy(yylval.t, yytext); return OP;}
\= {strcpy(yylval.t, yytext); return EQ;}
\n return yytext[0];
%%

int yywrap()
{
return 1;
}
