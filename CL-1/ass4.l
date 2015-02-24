%{
#include<stdio.h>
#include<stdlib.h>
char *token,*state,*attr;
int line=1;
%}
preprocessor #
GT >
LT <
keyword void|int|float|char|enum|double|main|if|for|while|switch|return|else|getch
symbol \(|\)|\;|\{|\}|\&
operator \+|\-|\*|\/
multi \/\*[^\*\/]*\*\/
%%
{preprocessor} {token="preprocessor"; state=yytext;
printf("%d\t%s\t\t%s\n",line,state,token);
}
[a-zA-z]+\.[h] {token="HEADER"; state=yytext;
printf("%d\t%s\t\t%s\n",line,state,token);
}
{keyword} {token="keyword"; state=yytext;
printf("%d\t%s\t\t%s\n",line,state,token);
}
include|define|[a-zA-Z]+[a-zA_Z0-9]* {token="identifier"; state=yytext;
printf("%d\t%s\t\t%s\n",line,state,token);
}
{symbol} {token="Special Symbol"; state=yytext;
printf("%d\t%s\t\t%s\n",line,state,token);
}
{GT} {token="Greater Than"; state=yytext;
printf("%d\t%s\t\t%s\n",line,state,token);
}
{LT} {token="Less than"; state=yytext;
printf("%d\t%s\t\t%s\n",line,state,token);
}
{multi} {token="Comment"; state=yytext;
printf("%d\t%s\t\t%s\n",line,state,token);
}
\".*\" {token="string"; state=yytext;
printf("%d\t%s\t\t%s\n",line,state,token);
}
[\n] {line++;}
%%
void main()
{
  printf("\n\n");
  FILE *fp;
  fp=fopen("ass4.txt","r");
  yyin=fp;
  yylex();
}  
int yywrap()
{
  return(1);
}

