%token Realnumber Plus Minus Mul Div Lp Rp
%{
	#include<stdio.h>
%}
%%
statement : 
	  | statement e1 
		{ printf("%d\n",$2); }
	  | statement e1 '\n' 
		{ printf("%d\n\n",$2); }
	  ; 
e1 : e1 Minus e2
	{ printf("%d-%d=%d\n",$1,$3,$1-$3);
	  $$ = $1-$3;}
   | e1 Plus e2
	{ printf("%d+%d=%d\n",$1,$3,$1+$3);
	  $$ = $1+$3;}
   |e2 { $$ = $1;}
e2 : e2 Mul e3
	{ printf("%d*%d=%d\n",$1,$3,$1*$3);
	  $$ = $1*$3;}
   | e2 Div e3
	{ printf("%d/%d=%d\n",$1,$3,$1/$3);
	  $$ = $1/$3;}
   | e3 { $$ = $1;}
e3 : Lp e1 Rp
	{ printf("");
	  $$ = $2;}
   | Minus Realnumber
	{ printf("");
	  $$ = -$2;}
   | Realnumber
	{ printf("");
	  $$ = $1;}
	
%%
int main()
{
	yyparse();
	return 0;
}
int yyerror(char *msg)
{
	printf("Error:%s \n", msg);
}
