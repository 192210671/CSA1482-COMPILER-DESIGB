%{
#include <stdio.h>

#define MAX_SIZE 100

// Buffers to store numbers and words
char numbers[MAX_SIZE][MAX_SIZE];
char words[MAX_SIZE][MAX_SIZE];
int num_count = 0;
int word_count = 0;

%}

%%

[0-9]+                  { 
                          // Store the number
                          snprintf(numbers[num_count], MAX_SIZE, "%s", yytext);
                          num_count++;
                        }

[a-zA-Z]+                { 
                          // Store the word
                          snprintf(words[word_count], MAX_SIZE, "%s", yytext);
                          word_count++;
                        }

[ \t\n\r]+              { /* Ignore whitespace */ }

.                       { /* Ignore other characters */ }

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

    // Print numbers
    printf("Numbers:\n");
    for (int i = 0; i < num_count; i++) {
        printf("%s\n", numbers[i]);
    }

    // Print words
    printf("Words:\n");
    for (int i = 0; i < word_count; i++) {
        printf("%s\n", words[i]);
    }

    return 0;
}

int yywrap() {
    return 1;
}
