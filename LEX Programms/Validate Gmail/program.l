%{
#include <stdio.h>
#include <string.h>
#include <ctype.h>

int is_valid_email(const char* email) {
 
    const char* at_sign = strchr(email, '@');
    if (at_sign == NULL) {
        return 0;    }

    
    const char* dot = strchr(at_sign, '.');
    if (dot == NULL) {
        return 0;    }

    
    if (at_sign == email || dot == at_sign + 1 || *(dot + 1) == '\0') {
        return 0;
}
    while (*email) {
        if (!isalnum(*email) && *email != '@' && *email != '.' && *email != '-' && *email != '_') {
            return 0; 
        }
        email++;
    }

    return 1; // Valid email
}

%}

%%

[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,} {
    if (is_valid_email(yytext)) {
        printf("Valid Email: %s\n", yytext);
    } else {
        printf("Invalid Email: %s\n", yytext);
    }
}
.|\n { /* ignore other characters */ }

%%

int main()  
{ 
    yylex(); 
    return 0;
} 

int yywrap()
{
    return 1;
}
