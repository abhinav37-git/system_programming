%{

#include<stdio.h>

int lines=0, words=0,s_letters=0,c_letters=0, num=0,
spl_char=0,total=0;

%}

%%

\n { lines++; words++;}

[\t ' '] words++;

[A-Z] c_letters++;

[a-z] s_letters++;

[0-9] num++;

. spl_char++;

%%

int main(void)

{

FILE *file;
file=fopen("data.txt","r");
if (!file) {
    perror("could not open the file");
    exit(EXIT_FAILURE);
}
yyin=file;
yylex();
total=s_letters+c_letters+num+spl_char;
printf(" This File contains ...\n");
printf("\t%d lines\n", lines);
printf("\t%d words\n",words);
printf("\t%d small letters\n", s_letters);
printf("\t%d capital letters\n",c_letters);
printf("\t%d digits\n", num);
printf("\t%d special characters\n",spl_char);
printf("\tIn total %d characters.\n",total);
fclose(file);
return 0;
}

int yywrap()

{

return(1);

}
