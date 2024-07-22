%{
#include <stdio.h>
#include <string.h>

void check_keyword(char *lexeme);

%}

%option noyywrap

%%
"auto"|"break"|"case"|"char"|"const"|"continue"|"default"|"do"|"double"|"else"|"enum"|"extern"|"float"|"for"|"goto"|"if"|"int"|"long"|"register"|"return"|"short"|"signed"|"sizeof"|"static"|"struct"|"switch"|"typedef"|"union"|"unsigned"|"void"|"volatile"|"while" {
    printf("Keyword: %s\n", yytext);
}
[a-zA-Z_][a-zA-Z0-9_]* {
    check_keyword(yytext);
}
. {
    /* Ignore other characters */
}

%%

void check_keyword(char *lexeme) {
    /* List of C keywords */
    char *keywords[] = {
        "auto", "break", "case", "char", "const", "continue", "default", "do", "double",
        "else", "enum", "extern", "float", "for", "goto", "if", "int", "long", "register",
        "return", "short", "signed", "sizeof", "static", "struct", "switch", "typedef",
        "union", "unsigned", "void", "volatile", "while", NULL
    };
    
    int i;
    for (i = 0; keywords[i] != NULL; i++) {
        if (strcmp(lexeme, keywords[i]) == 0) {
            printf("Keyword: %s\n", lexeme);
            return;
        }
    }
    printf("Identifier: %s\n", lexeme);
}

int main() {
    yylex();
    return 0;
}
