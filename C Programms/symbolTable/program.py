#include<stdio.h>
#include<stdlib.h>
#include<string.h>
int cnt=0;
struct symtab
{
	char label[20];
	int addr;
}
sy[50];
void insert();
int search(char *);
void display();
void modify();

int main()
{
	int ch,val;
	char lab[10];
	do
	{
		printf("\n1.Insert\n2.Display\n3.Search\n4.Modify\n5.Exit\n");
		scanf("%d",&ch);
		switch(ch)
		{
			case 1:
				insert();
				break;
		    case 2:
				display();
				break;
		    case 3:
				printf("Enter the Label:");
				scanf("%s",lab);
				val=search(lab);
				if(val==1)
				printf("label is found");
				else
				printf("label not found");
		    	break;
		    case 4:
				modify();
				break;
			case 5:
				exit(0);
				break;					
		}
		
	}while(ch<5);
}

void insert()
{
	int val;
	char lab[10];
	int symbol;
	printf("Enter the Label:");
	scanf("%s",lab);
	val=search(lab);
	if (val==1)
	printf("Duplicate Symbol");
	else
	{
		strcpy(sy[cnt].label,lab);
		printf("Enter the address:");
		scanf("%d",&sy[cnt].addr);
		cnt++;
	}
}
int search(char *s)
{
	int flag=0,i;
	for(i=0;i<cnt;i++)
	{
		if(strcmp(sy[i].label,s)==0)
		flag=1;
	}
	return flag;
}
void modify()
{
	int val,ad,i;
	char lab[10];
	printf("Enter the Lablel:");
	scanf("%s",lab);
	val=search(lab);
	if(val==0)
	printf("There is no symbol:%s",lab);
	else
	{
		printf("Label is found\n");
		printf("Enter the Address:");
		scanf("%d",&ad);
		for(i=0;i<cnt;i++)
		{
			if(strcmp(sy[i].label,lab)==0)
			sy[i].addr=ad;
		}
	}
	
}
void display()
{
	int i;
	 printf("|------|-------|\n");
	for(i=0;i<cnt;i++)
	{  
		printf("| %s    | %d    |\n",sy[i].label,sy[i].addr);
		printf("|------|-------|\n");
	}
}
