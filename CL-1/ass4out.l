bash-4.2$ lex ass4.l
bash-4.2$ gcc lex.yy.c
bash-4.2$ ./a.out


1	#		preprocessor
1	include		identifier
1	<		Less than
1	stdio.h		HEADER
1	>		Greater Than
2	/* Start here */		Comment
4	void		keyword
 4	main		keyword
4	(		Special Symbol
4	)		Special Symbol
5	{		Special Symbol
  6	int		keyword
 6	a		identifier
6	;		Special Symbol
  7	printf		identifier
7	(		Special Symbol
7	"HEllo World"		string
7	)		Special Symbol
7	;		Special Symbol
  8	getch		keyword
8	(		Special Symbol
8	)		Special Symbol
8	;		Special Symbol
9	}		Special Symbol
