%{
#include <stdio.h>

int positive_count = 0;
int negative_count = 0;

void process_numbers();
%}

%%

[0-9]+              { positive_count++; }
-?[0-9]+            { if (yytext[0] == '-') negative_count++; else positive_count++; }
[ \t\n\r]+          { /* Ignore whitespace */ }
.                   { /* Ignore other characters */ }

%%

int main(int argc, char *argv[]) {
    if (argc < 2) {
        fprintf(stderr, "Usage: %s <input_file>\n", argv[0]);
        return 1;
    }

    FILE *file = fopen(argv[1], "r");
    if (!file) {
        perror("Error opening file");
        return 1;
    }

    yyin = file;
    yylex();

    fclose(file);

    printf("Number of Positive Numbers: %d\n", positive_count);
    printf("Number of Negative Numbers: %d\n", negative_count);

    return 0;
}

int yywrap() {
    return 1;
}
