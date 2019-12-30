%{
	#include"y.tab.h"
%}
%option noyywrap
%%
[0-9]+		{	yylval = atoi(yytext);
			return(Realnumber);	}
"+"		{	return(Plus);	}
"-"		{	return(Minus);	}
"*"		{	return(Mul);	}
"/"		{	return(Div);	}
"("		{	return(Lp);	}
")"		{	return(Rp);	}
\n		{	return '\n' ;}
.		{	return yytext[0];}
%%
