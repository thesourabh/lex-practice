%{
#include<stdio.h>
int vowels = 0, whitespaces = 0, newlines = 0;
void print();
%}

%%
[aeiouAEIOU] vowels++;
[ \t] whitespaces++;
\n newlines++;
. {}
%%
void disp()
{
printf("Vowels: %d\n", vowels);
printf("Whitespaces: %d\n", whitespaces);
printf("Newlines: %d\n", newlines - 1);
}

main()
{
FILE *fp;
fp = fopen("ass2.txt","r");
yyin = fp;
yylex();
fclose(fp);
disp();
}
int yywrap()
{
return 1;
}
