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
