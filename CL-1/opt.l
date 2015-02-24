%{
#include<stdio.h>
#include<string.h>

char st[10][10], val[10][10];
int top = 0, i = 0, j = 0, e = -1;
int flag = 0;
char curr[10];

int exists()
{
for(i = 0; i < top; i++)
{
if (strcmp(val[i], val[top]) == 0) return i;
}
return -1;
}

int isKey()
{
for(i = 0; i < top; i++)
{
if (strcmp(st[i], curr) == 0) return i;
}
return -1;
}


void print()
{
int z;
for(z = 0; z < top; z++)
{

strcpy(curr, val[z]);
if(isKey() == -1)
	printf("\n%s = %s\n", st[z], val[z]);
}

}



%}


%%

[a-zA-Z][a-zA-Z0-9]* {
if (flag == 0)
{
strcpy(st[top],yytext);
}
else if (flag == 1)
{
strcpy(curr, yytext);
i = isKey();
strcpy(curr, val[i]);
j = isKey();
if (i != -1 && j != -1){   strcpy(val[top], st[j]);  }
else{  strcpy(val[top],yytext);  }

}
else if (flag == 2)
{

strcpy(curr, yytext);
i = isKey();
strcpy(curr, val[i]);
j = isKey();
if (i != -1 && j != -1){   strcat(val[top], st[j]);  }
else{  strcat(val[top], yytext);  }

}


}
[\+\-\*\/] {strcat(val[top],yytext); flag = 2;}
\= {flag = 1;}
\n {
flag = 0;
e = exists();
if (e != -1)
{
strcpy(val[top], st[e]);
}

printf("\nAAAA%d   %s   %s\n", top, st[top], val[top]);
for(i = 0; i < top; i++)
{
printf("\nBBBB%d   %s   %s\n", i, st[i], val[i]);
}

top++;
}

%%

main()
{
FILE *fp = fopen("opinp.txt","r");
yyin = fp;
yylex();
print();
}

int yywrap()
{
return 1;
}
