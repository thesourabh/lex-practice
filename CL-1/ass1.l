%{
#include<stdio.h>
char id[10][10], op[10], num[10][10];
int itop = 0, otop = 0, ntop = 0, i = 0;
%}
%%
[a-zA-Z_][a-zA-Z0-9_]* {strcpy(id[itop++],yytext);}
[0-9]+\.[0-9]+ {strcpy(num[ntop++],yytext);}
[0-9]+ {strcpy(num[ntop++],yytext);}
[\+\-\*\/\%] {op[otop++] = yytext[0];}
\; {
printf("\nIdentifiers: ");
for(i = 0; i < itop; i++)
{
 printf(" %s", id[i]);
}
printf("\nNumbers: ");
for(i = 0; i < ntop; i++)
{
 printf(" %s", num[i]);
}
printf("\nOperators: ");
for(i = 0; i < otop; i++)
{
 printf(" %c", op[i]);
}
printf("\n");
exit(0);
}
%%
main()
{
yylex();
}
int yywrap()
{
return 1;
}

/* Output

bash-4.2$ lex ass1.l
bash-4.2$ gcc lex.yy.c
bash-4.2$ ./a.out
dist / time - 30;
    
Identifiers:  dist time
Numbers:  30
Operators:  / -

*/
