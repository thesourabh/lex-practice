%{
#include<stdio.h>
#include<string.h>
char var[10][10], op[10];
int vtop = -1, otop = -1, prec = 0;
char out[20], atop = -1;
int i = 0;
void pushTemp(int i)
{
char t[6];
strcpy(t,"temp");
t[4] = i + 48;
t[5] = '\0';
strcpy(var[vtop], t);
}
int process(int n, char o)
{
if (n <= prec) 
{
printf("\ntemp%d = ", i);
printf("%s %c ", var[vtop - 1], op[otop]);
printf("%s;", var[vtop]);
vtop -= 1;
pushTemp(i);
op[otop] = o;
prec = n;
i++;
}
else
{
otop += 1;
op[otop] = o;
prec = n;
}
}
void pushall()
{
int j = 0;
while(otop > -1)
{
printf("\ntemp%d = ", i);
printf("%s ", var[vtop - 1]);
printf("%c ", op[otop--]);
printf("%s;", var[vtop]);
vtop -= 1;
pushTemp(i);
i++;
}
printf("\n");
}
%}
%%
[a-zA-Z][a-zA-Z0-9]* { vtop += 1; strcpy(var[vtop],yytext);}
[\+\-] {process(2, yytext[0]);}
[\*\/] {process(3, yytext[0]);}
\; {pushall(); exit(0);}
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

bash-4.2$ lex ass9.l
bash-4.2$ gcc lex.yy.c
bash-4.2$ ./a.out
a + b * c;
    
temp0 = b * c;
temp1 = a + temp0;
bash-4.2$ ./a.out
a * b + c * d / e;    
   
temp0 = a * b;    
temp1 = c * d; 
temp2 = temp1 / e;
temp3 = temp0 + temp2; 

*/
