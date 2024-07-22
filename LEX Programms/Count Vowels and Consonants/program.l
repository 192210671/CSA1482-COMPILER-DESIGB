%{
#include <stdio.h>

int vowel_count = 0;
int consonant_count = 0;
%}

%%

[aeiouAEIOU]    { vowel_count++; }
[bcdfghjklmnpqrstvwxyzBCDFGHJKLMNPQRSTVWXYZ] { consonant_count++; }
.               { /* Ignore non-alphabetic characters */ }
\n              { /* Ignore newline characters */ }

%%

int main(void) {
    printf("Enter a sentence:\n");
    yylex();
    printf("Number of vowels: %d\n", vowel_count);
    printf("Number of consonants: %d\n", consonant_count);
    return 0;
}

int yywrap() {
    return 1;
}
