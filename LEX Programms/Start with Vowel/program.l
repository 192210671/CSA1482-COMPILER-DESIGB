%{
#include <stdio.h>
%}

%%
^[aeiouAEIOU].*	{ printf("Accepted: %s\n",yytext); }
.*		{ printf("Rejected:%s\n",yytext); }
%%

int main(int argc,char *argv[])
{
	yylex();
	return 0;
}

int yywrap()
{
	return 1;
}
