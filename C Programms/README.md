# Compiler Design C Programs

This repository contains a collection of C programs related to compiler design. Each program demonstrates fundamental concepts in compiler construction, such as lexical analysis, syntax analysis, and parsing techniques. These programs are designed to help learners and practitioners understand various aspects of compiler design through practical examples.

## Table of Contents

1. [Identifying Tokens](#1-identifying-tokens)
2. [Identifying Comments](#2-Identiying-Comments)
3. [Symbol Table Management](#3-symbol-table-management)
4. [Error Handling in Compilers](#4-error-handling-in-compilers)
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



