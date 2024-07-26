#include <stdio.h>
#include <string.h>
#include <ctype.h>

#define MAX 10

// Function prototypes
void findFirst(char grammar[MAX][MAX], int n, char firstSets[MAX][MAX], char nonTerminals[MAX], int nonTerminalCount);
void calculateFirst(char grammar[MAX][MAX], int n, char symbol, char firstSet[], char firstSets[MAX][MAX], char nonTerminals[MAX], int nonTerminalCount);
int isTerminal(char symbol);
int containsEpsilon(char firstSet[]);
void addToFirstSet(char firstSet[], char symbol);

int main() {
    int n, i, nonTerminalCount = 0;
    char grammar[MAX][MAX], firstSets[MAX][MAX] = {0}, nonTerminals[MAX] = {0};

    // Input grammar
    printf("Enter the number of grammar rules: ");
    scanf("%d", &n);
    printf("Enter the grammar (use # for epsilon):\n");
    for (i = 0; i < n; i++) {
        scanf("%s", grammar[i]);
        if (!strchr(nonTerminals, grammar[i][0])) {
            nonTerminals[nonTerminalCount++] = grammar[i][0];
        }
    }

    // Find FIRST sets
    findFirst(grammar, n, firstSets, nonTerminals, nonTerminalCount);

    // Print FIRST sets
    printf("\nFIRST sets:\n");
    for (i = 0; i < nonTerminalCount; i++) {
        printf("FIRST(%c) = { ", nonTerminals[i]);
        for (int j = 0; firstSets[i][j] != '\0'; j++) {
            printf("%c ", firstSets[i][j]);
        }
        printf("}\n");
    }

    return 0;
}

void findFirst(char grammar[MAX][MAX], int n, char firstSets[MAX][MAX], char nonTerminals[MAX], int nonTerminalCount) {
    int i;
    for (i = 0; i < nonTerminalCount; i++) {
        calculateFirst(grammar, n, nonTerminals[i], firstSets[i], firstSets, nonTerminals, nonTerminalCount);
    }
}

void calculateFirst(char grammar[MAX][MAX], int n, char symbol, char firstSet[], char firstSets[MAX][MAX], char nonTerminals[MAX], int nonTerminalCount) {
    int i, j;
    if (isTerminal(symbol)) {
        addToFirstSet(firstSet, symbol);
        return;
    }
    for (i = 0; i < n; i++) {
        if (grammar[i][0] == symbol) {
            for (j = 2; grammar[i][j] != '\0'; j++) {
                char currentSymbol = grammar[i][j];
                char tempFirstSet[MAX] = "";
                calculateFirst(grammar, n, currentSymbol, tempFirstSet, firstSets, nonTerminals, nonTerminalCount);
                for (int k = 0; tempFirstSet[k] != '\0'; k++) {
                    if (tempFirstSet[k] != '#') {
                        addToFirstSet(firstSet, tempFirstSet[k]);
                    }
                }
                if (!containsEpsilon(tempFirstSet)) {
                    break;
                }
                if (grammar[i][j + 1] == '\0') {
                    addToFirstSet(firstSet, '#');
                }
            }
        }
    }
}

int isTerminal(char symbol) {
    return !isupper(symbol);
}

int containsEpsilon(char firstSet[]) {
    return strchr(firstSet, '#') != NULL;
}

void addToFirstSet(char firstSet[], char symbol) {
    if (!strchr(firstSet, symbol)) {
        int len = strlen(firstSet);
        firstSet[len] = symbol;
        firstSet[len + 1] = '\0';
    }
}
