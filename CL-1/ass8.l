%{
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
int on = 0;
typedef struct row{
int id;
char name[10];
char type[10];
int size;
}row;
row a[10];
int top = 0;
char ty[7],var[10];
int getSize(char* t)
{
	if (strcmp(t, "int") == 0)
		return sizeof(int);
	else if (strcmp(t, "float") == 0)
		return sizeof(float);
	else if (strcmp(t, "char") == 0)
		return sizeof(char);
}
void push()
{
	a[top].id = top+1;
	strcpy(a[top].name, var);
	strcpy(a[top].type, ty);
	a[top].size = getSize(ty);
	top++;
}
void print()
{
	int i = 0;
	printf("S. No.\tName\tType\tSize\n");
	printf("------------------------\n");
	for (i; i < top;i++)
	{
		printf("%d\t%s\t%s\t%d\n", a[i].id, a[i].name, a[i].type, a[i].size);
	}
}

%}


%%
int |
float |
char |
void {on = 1;strcpy(ty,yytext);}
\{ {on = 0;}
[a-zA-Z][a-zA-Z0-9]* {if (on == 1){strcpy(var,yytext);}}
\, {if (on == 1){push();}}
\; {if (on == 1){push();} on = 0;}
. {}
\n {}
%%
main()
{
FILE *fp = fopen("ass8.txt","r");
yyin = fp;
yylex();
print();
fclose(fp);
}
int yywrap()
{
return 1;
}

