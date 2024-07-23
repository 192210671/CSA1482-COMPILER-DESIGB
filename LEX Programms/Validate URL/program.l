%{
#include <stdio.h>

int isValidURL = 0;
%}

%%
((http|https|ftp)s?:\/\/[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}(\/[a-zA-Z0-9+=?._-]*)*) { 
    isValidURL = 1; 
    printf("\nURL Valid\n"); 
    return 0;  // Stop further processing
}
.|\n { 
    if (!isValidURL) {
        printf("\nURL Invalid\n");
    }
    return 0;  // Stop further processing
}

%%

// driver program 
int main()  
{ 
    printf("Enter URL: "); 
    yylex(); 
    return 0;
} 

int yywrap()
{
    return 1;
}
