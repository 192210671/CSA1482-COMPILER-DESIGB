%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Define the words to replace
#define REPLACE_FROM "hello"
#define REPLACE_TO "namaskar"

%}

%%
"hello" { printf("%s", REPLACE_TO); }
.|\n { printf("%s", yytext); }
%%

 
int main(int argc, char *argv[])  
{ 
    if(argc < 2) {
        fprintf(stderr, "Usage: %s <input-file>\n", argv[0]);
        exit(1);
    }

    FILE *file = fopen(argv[1], "r");
    if(!file) {
        perror("Failed to open file");
        exit(1);
    }

    yyin = file;
    yylex();
    fclose(file);

    return 0;
} 

int yywrap()
{
    return 1;
}
