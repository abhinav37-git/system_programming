%{
#include<stdio.h>
int c=0;
%}

%%

[/][/][a-zA-Z0-9]* {c++;}

[/][*][a-zA-Z0-9][*][/] {c++;}

%%

main(int argc,char*argv[ ])
{
FILE *file;
file=fopen(argv[1],"r");
if (!file) {
    perror("could not open the file");
    exit(EXIT_FAILURE);
}
yyin=file;
yylex();
fclose(file);
printf("\nNo. of comment lines = %d\n",c);
}

int yywrap()
{
return(1);
}
