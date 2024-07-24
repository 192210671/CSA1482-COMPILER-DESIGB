# Compiler Design C Programs

This repository contains a collection of C programs related to compiler design. Each program demonstrates fundamental concepts in compiler construction, such as lexical analysis, syntax analysis, and parsing techniques. These programs are designed to help learners and practitioners understand various aspects of compiler design through practical examples.

## Table of Contents

1. [Identifying Tokens](#1-identifying-tokens)
2. [Identifying Comments](#2-Identiying-Comments)
3. [Identifying Operators](#3-identifying-operators)
4. [Identifying words,nweline and characters](#4-identifying-words-newline-and-characters)
5. [Intermediate Code Generation](#5-intermediate-code-generation)
6. [Code Optimization Techniques](#6-code-optimization-techniques)
7. [Code Generation](#7-code-generation)

## Advantages
- **Educational Value**: Provides practical examples to help understand complex compiler design concepts.
- **Flexibility**: The programs can be modified to explore different aspects of compiler construction.
- **Hands-on Learning**: Allows learners to apply theoretical knowledge in practical scenarios.

## Disadvantages
- **Complexity**: Understanding and modifying these programs might be challenging for beginners.
- **Limited Scope**: The programs focus on basic concepts and may not cover advanced compiler design topics.
- **Maintenance**: As compiler technologies evolve, some techniques may become outdated.

## Programs
## 1. Identifying Tokens
SOURCE CODE
```c
#include<stdio.h>
#include<ctype.h>
#include<string.h>
int main()
{
	int i,ic=0,m,cc=0,oc=0,j;
	char b[30],operators[30],identifiers[30],constants[30];
	printf("enter the string : ");
	scanf("%[^\n]s",&b);
	for(i=0;i<strlen(b);i++)
	{
    	if(isspace(b[i]))
		{
    	    continue;
    	}
    	else if(isalpha(b[i]))
		{
        	identifiers[ic] =b[i];
        	ic++;
    	}
    	else if(isdigit(b[i]))
		{
        	m=(b[i]-'0');
        	i=i+1;
        	while(isdigit(b[i]))
			{
            	m=m*10 + (b[i]-'0');
            	i++;
        	}
        	i=i-1;
        	constants[cc]=m;
        	cc++;
    	}
    	else
		{
        	if(b[i]=='*')
			{
            	operators[oc]='*';
            	oc++;
        	}
        	else if(b[i]=='-')
			{
            	operators[oc]='-';
            	oc++;
        	}
        	else if(b[i]=='+')
			{
            	operators[oc]='+';
            	oc++;
        	}
         	else if(b[i]=='=')
			{
            	operators[oc]='=';
            	oc++;
        	}
  		}
	}
    printf(" identifiers : ");
     for(j=0;j<ic;j++)
	 {
        printf("%c ",identifiers[j]);
     }
    printf("\n constants : ");
     for(j=0;j<cc;j++)
	 {
        printf("%d ",constants[j]);
     }
    printf("\n operators : ");
      for(j=0;j<oc;j++)
	  {
        printf("%c ",operators[j]);
      }
}
```
## 3. Identifying Operators
SOURCE CODE
```c
#include<stdio.h>
#include<conio.h>
int main()
{
	char s[5];
	printf("\n enter the operators:");
	gets(s);
	switch(s[0])
	{
		case'>':
			if(s[1]=='=')
			{
				printf("\n Greater than or equal");
			}
			else
			{
				printf("\nGreater than");
			}
				break;
		case'<':
			if(s[1]=='=')
			{
				printf("\n Less than or equal");
			}
			else
			{
				printf("\n Less than");
			}
				break;
		case'=':
			if(s[1]=='=')
			{
				printf("\n Equal to");
			}
			else
			{
				printf("\n Assignment");
			}
				break;
		case'!':
			if(s[1]=='=')
			{
				printf("\nNot equal");
				}
			else
			{
				printf("\n Bit Not");
					}
			break;
		case'&':
			if(s[1]=='&')
			{
				printf("\n Logical AND");
								}
			else
			{
				printf("\nBitwise AND");
													}	
			break;	
		case'|': 
			if(s[1]=='|') 
				printf("\nLogical OR"); 
			else
				printf("\nBitwise OR"); 
			break;
		case'+': 
			printf("\n Addition"); 
			break;
		case'-': 
			printf("\nSubstraction"); 
			break;
		case'*': 
			printf("\nMultiplication"); 
			break;
		case'/':	
			printf("\nDivision");
			break;
		case'%': 
			printf("Modulus"); 
			break;
		default: 
			printf("\n Not a operator");
			break;
																			
	}
}
```
## 4-Identifying Words Newline and Character
SOURCE CODE
```c
#include <stdio.h>

int main() {
    char str[100]; 
    int words = 0, newline = 0, characters = 0; 

    printf("Enter the input (end with ~):\n");
   
    scanf("%[^~]", str);

   
    for (int i = 0; str[i] != '\0'; i++) {
        if (str[i] == ' ') {
            
            words++;
        } else if (str[i] == '\n') {
            
            newline++;
            words++;
        } else {
           
            characters++;
        }
    }

   
    if (characters > 0) {
       
        words++;
        newline++;
    }


    printf("Total number of words : %d\n", words);
    printf("Total number of lines : %d\n", newline);
    printf("Total number of characters : %d\n", characters);

    return 0;
}
```



