%{
#include <stdio.h>

int vowel_count = 0;
int consonant_count = 0;
int number_count = 0;
%}

%%

[aeiouAEIOU]    { vowel_count++; }
[bcdfghjklmnpqrstvwxyzBCDFGHJKLMNPQRSTVWXYZ] { consonant_count++; }
[0-9]           { number_count++; }
.               { /* Ignore non-alphabetic characters */ }
\n              { /* Ignore newline characters */ }

%%

int main() {
    FILE *f;
    char file[100]; // Increased size to handle longer filenames
    printf("Enter File Name : ");
    scanf("%s", file);
    f = fopen(file, "r");
    if (!f) {
        perror("Error opening file");
        return 1;
    }
    yyin = f;
    yylex();
    fclose(f);
    printf("\nNumber of Vowels : %d", vowel_count);
    printf("\nNumber of Consonants : %d", consonant_count);
    printf("\nNumber of Numbers : %d", number_count);
    return 0;
}

int yywrap() {
    return 1;
}
