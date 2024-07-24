# LEX Programs Collection

This repository contains a collection of LEX (Lexical Analyzer) programs designed to perform various text processing tasks. Each program is crafted to demonstrate specific lexical analysis capabilities such as pattern matching, text substitution, and validation.

## Table of Contents

1. [Identify Capital Words](#1-Identify-Capital-Words)
2. [Check if Input is Digit](#2-check-if-input-is-digit)
3. [Validate Mobile Numbers](#3-validate-mobile-numbers)
4. [Count Vowels and Consonants](#4-count-vowels-and-consonants)
5. [Separate Keywords and Identifiers](#5-separate-keywords-and-identifiers)
6. [Count Positive and Negative Numbers](#6-count-positive-and-negative-numbers)
7. [Recognize Numbers and Words](#7-recognize-numbers-and-words)
8. [Accept String Starting with Vowel](#8-accept-string-starting-with-vowel)
9. [Find Length of Longest Word](#9-find-length-of-longest-word)
10. [Validate URLs](#10-validate-urls)
11. [Validate DOB](#11-validate-dob)
12. [Recognize Word and Relational Operator](#12-recognize-word-and-relational-operator)
13. [Replace Word in File](#13-replace-word-in-file)
14. [Basic Mathematical Operations](#14-basic-mathematical-operations)
15. [Check Valid Email Address](#15-check-valid-email-address)
16. [Convert Substring](#16-convert-substring)

## Usage

1. Save the LEX code in a `.l` file.
2. Compile the LEX program using Flex:
   ```sh
   flex program.l
   gcc lex.yy.c
   a.exe
## Advantages
1. Simplifies lexical analysis by automating the creation of scanners.
2. Can handle complex text patterns with ease.
3. Efficient and fast processing of text input.
## Disadvantages
1. Limited to lexical analysis; not suitable for parsing more complex grammar without additional tools like 
   YACC/Bison.
2. Requires understanding of regular expressions and LEX syntax.
## 1. Identify Capital Words
   Description: This program identifies and prints capital words from the given input.
->Source Code
   ```sh
%{
#include <stdio.h>
%}

%%

[A-Z]+ { printf("Capital word: %s\n", yytext); }
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
```
## 2. Check if Input is Digit
   Description: This program checks whether the given input is a digit or not.
   ->Source Code
   ```sh
%{
#include <stdio.h>
%}

%%

[0-9]+ { printf("Digit: %s\n", yytext); }
.|\n { printf("Not a digit: %s\n", yytext); }

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
```
## 3. Validate Mobile Numbers
   Description: This program validates mobile numbers to ensure they follow a specific format.
   ->Source Code
   ```sh
%{
#include <stdio.h>
%}

%%

[7-9][0-9]{9} { printf("Valid mobile number: %s\n", yytext); }
.|\n { printf("Invalid mobile number: %s\n", yytext); }

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
```
## 4. Count Vowels and Consonants
   Description: This program counts the number of vowels and consonants in the given input.
   ->Source Code
   ```sh
%{
#include <stdio.h>
int vowels = 0;
int consonants = 0;
%}

%%

[aeiouAEIOU] { vowels++; }
[bcdfghjklmnpqrstvwxyzBCDFGHJKLMNPQRSTVWXYZ] { consonants++; }
.|\n { /* ignore other characters */ }

%%

int main()  
{ 
    yylex(); 
    printf("Vowels: %d\n", vowels);
    printf("Consonants: %d\n", consonants);
    return 0;
} 

int yywrap()
{
    return 1;
}
```
## 5. Separate Keywords and Identifiers
   Description: This program separates keywords and identifiers from the given input.
   ->Source Code
   ```sh
%{
#include <stdio.h>
#include <string.h>

const char* keywords[] = {
    "auto", "break", "case", "char", "const", "continue", "default",
    "do", "double", "else", "enum", "extern", "float", "for", "goto",
    "if", "int", "long", "register", "return", "short", "signed",
    "sizeof", "static", "struct", "switch", "typedef", "union",
    "unsigned", "void", "volatile", "while"
};
int is_keyword(const char* word) {
    for (int i = 0; i < 32; ++i) {
        if (strcmp(word, keywords[i]) == 0) {
            return 1;
        }
    }
    return 0;
}
%}

%%

[a-zA-Z_][a-zA-Z0-9_]* {
    if (is_keyword(yytext)) {
        printf("Keyword: %s\n", yytext);
    } else {
        printf("Identifier: %s\n", yytext);
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
```
## 6. Count Positive and Negative Numbers
   Description: This program identifies and counts positive and negative numbers.
   ->Source Code
```sh
%{
#include <stdio.h>
int positive_count = 0;
int negative_count = 0;
%}

%%

[0-9]+ { positive_count++; printf("Positive number: %s\n", yytext); }
[-][0-9]+ { negative_count++; printf("Negative number: %s\n", yytext); }
.|\n { /* ignore other characters */ }

%%

int main()  
{ 
    yylex(); 
    printf("Positive numbers: %d\n", positive_count);
    printf("Negative numbers: %d\n", negative_count);
    return 0;
} 

int yywrap()
{
    return 1;
}
```
## 7. Recognize Numbers and Words
   Description: This program recognizes numbers and words in a given statement.
   ->Source Code
```sh
%{
#include <stdio.h>
%}

%%

[0-9]+ { printf("Number: %s\n", yytext); }
[a-zA-Z]+ { printf("Word: %s\n", yytext); }
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
```
## 8. Accept String Starting with Vowel
   Description: This program accepts strings that start with a vowel.
   ->Source Code
```sh
%{
#include <stdio.h>
%}

%%

[aeiouAEIOU][a-zA-Z]* { printf("String starting with vowel: %s\n", yytext); }
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
```
## 9. Find Length of Longest Word
   Description: This program finds the length of the longest word in the input.
   ->Source Code
```sh
%{
#include <stdio.h>
int max_length = 0;
%}

%%

[a-zA-Z]+ {
    int length = strlen(yytext);
    if (length > max_length) {
        max_length = length;
    }
}
.|\n { /* ignore other characters */ }

%%

int main()  
{ 
    yylex(); 
    printf("Length of the longest word: %d\n", max_length);
    return 0;
} 

int yywrap()
{
    return 1;
}
```
## 10. Validate URLs
   Description: This program validates URLs to ensure they follow a standard format.
   ->Source Code
```sh
%{
#include <stdio.h>
%}

%%

http[s]?://[a-zA-Z0-9./?=_-]+ { printf("Valid URL: %s\n", yytext); }
.|\n { printf("Invalid URL: %s\n", yytext); }

%%

int main()  
{ 
    yylex(); 
```
## Conclusion

This repository demonstrates a variety of practical applications of LEX for lexical analysis and text processing. From simple tasks like counting vowels and identifying capital words to more complex validations like checking mobile numbers and URLs, each program showcases the versatility of LEX in handling different types of text inputs.

**Key Takeaways:**
- **LEX's Flexibility**: The ability to define patterns for text recognition and validation makes LEX a powerful tool for building lexical analyzers.
- **Efficiency**: These programs highlight LEX's capability to process and analyze large volumes of text efficiently.
- **Learning Tool**: For those new to lexical analysis or text processing, these examples serve as a useful learning resource to understand the foundational concepts and practical applications of LEX.

Feel free to explore, modify, and extend these programs according to your needs. If you have any questions or suggestions, please open an issue or contribute with a pull request.

Happy coding!
   
   
   





