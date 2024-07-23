%{
#include <stdio.h>
#include <string.h>

int maxLength = 0;
FILE *yyin;
%}

%%
[^\n\t ]+  { 
              int len = yyleng;
              if (len > maxLength) {
                  maxLength = len;
              }
           }
[ \t\n]+   { /* Ignore whitespace characters */ }
%%

int main(int argc, char *argv[])
{
    if (argc > 1) {
        yyin = fopen(argv[1], "r");
        if (!yyin) {
            perror("Could not open file");
            return 1;
        }
    } else {
        printf("Please provide an input file.\n");
        return 1;
    }

    yylex();
    fclose(yyin);
    printf("Length of the longest word: %d\n", maxLength);
    return 0;
}

int yywrap()
{
    return 1;
}
