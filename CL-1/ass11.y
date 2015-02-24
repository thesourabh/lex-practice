%{

#include "y.tab.h"
#include <stdio.h>
char oper[10];
%}

%union
{
char t[10];
}
%token <t> NUMBER
%token <t> ID
%token <t> OP
%token <t> EQ

%type <t> E

%%

SL : S '\n'
| SL S '\n'
;
S : E {}
;
E : ID EQ E OP E {
printf("\nMOV R0, %s",$3);
printf("\nMOV R1, %s", $5);
switch($4[0])
{
case '+':
strcpy(oper, "ADD");
break;
case '-':
strcpy(oper, "SUB");
break;
case '*':
strcpy(oper, "MUL");
break;
case '/':
strcpy(oper, "DIV");
break;
}
printf("\n%s R0, R1",oper);
printf("\nMOV %s, R0", $1);
printf("\n");
}
|NUMBER
|ID
;
%%
extern FILE *yyin;
int main()
{
yyin = fopen("gen.txt","r");
yyparse();
}

yyerror(char*a)
{
fprintf(stderr,"parse error!!!");
}
