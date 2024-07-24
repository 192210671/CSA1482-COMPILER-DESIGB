%{
#include <stdio.h>
#include <stdlib.h>

int result = 0;
int current_number = 0;
char current_operator = '+';

void apply_operator(char operator, int number) {
    switch(operator) {
        case '+': result += number; break;
        case '-': result -= number; break;
        case '*': result *= number; break;
        case '/': result /= number; break;
        default: printf("Unknown operator: %c\n", operator); exit(1);
    }
}

%}

%%

[0-9]+ {
    current_number = atoi(yytext);
    apply_operator(current_operator, current_number);
}

[\+\-\*/] {
    current_operator = yytext[0];
}

\n { printf("Result: %d\n", result); result = 0; current_operator = '+'; }
.|\t { /* ignore other characters */ }

%%


int main()  
{ 
    printf("Enter a mathematical expression: ");
    yylex(); 
    return 0;
} 

int yywrap()
{
    return 1;
}
