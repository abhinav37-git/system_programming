%{
#include<stdio.h>

int c = 0;
char ch;

%}

%%

"int"|"float"|"double"|"long"|"short" {
    while(1) {
        ch = input();
        if(ch == ',' || ch == ';') {
            c++;
            break;
        }
    }
}

.   { /* Ignore all other characters */ }

[\n] { /* Ignore newline characters */ }

[a-z]+ { /* Ignore lowercase identifiers */ }

%%

int main(int argc,char *argv[]) {
    yyin = fopen(argv[1],"r");
    if (!yyin) {
        printf("Error opening file\n");
        return -1;
    }
    yylex();

    printf("\nCount %d\n", c);
    fclose(yyin);
    return 0;
}

int yywrap() {
    return 1;
}


