%option outfile="scanner.c"

%{
    #include <stdio.h>
    /*#include "token.h"*/
    int line_num = 1;
    int ident_count = 1;
    int num_count = 1;
    int string_count = 1;
    int char_count = 1;
    extern FILE *yyin;
%}


%%

[ ] { /*Skip Space*/ }
[\n\t\r] { printf(yytext); line_num++;}
[/][*][\s\S]*?[*][/] { /*Skip Comments*/ }

[if] { printf("Token Class: keyword\t Token Value: \"%s\"\t Line Number: %d\n", yytext, line_num); }
[else] { printf("Token Class: keyword\t Token Value: \"%s\"\t Line Number: %d\n", yytext, line_num); }
[for] { printf("Token Class: keyword\t Token Value: \"%s\"\t Line Number: %d\n", yytext, line_num); }
[return] { printf("Token Class: keyword\t Token Value: \"%s\"\t Line Number: %d\n", yytext, line_num); }

[:] { printf("Token Class: colon\t Token Value: \"%s\"\t Line Number: %d\n", yytext, line_num); }

"true" { printf("Token Class: keyword\t Token Value: \"%s\"\t Line Number: %d\n", yytext, line_num); }
"false" { printf("Token Class: keyword\t Token Value: \"%s\"\t Line Number: %d\n", yytext, line_num); }
"char" { printf("Token Class: keyword\t Token Value: \"%s\"\t Line Number: %d\n", yytext, line_num); }
"int" { printf("Token Class: keyword\t Token Value: \"%s\"\t Line Number: %d\n", yytext, line_num); }
"string" { printf("Token Class: keyword\t Token Value: \"%s\"\t Line Number: %d\n", yytext, line_num); }
"void" { printf("Token Class: keyword\t Token Value: \"%s\"\t Line Number: %d\n", yytext, line_num); }
"bool" { printf("Token Class: keyword\t Token Value: \"%s\"\t Line Number: %d\n", yytext, line_num); }
"function" { printf("Token Class: keyword\t Token Value: \"%s\"\t Line Number: %d\n", yytext, line_num); }
"return" { printf("Token Class: keyword\t Token Value: \"%s\"\t Line Number: %d\n", yytext, line_num); }
"print" { printf("Token Class: keyword\t Token Value: \"%s\"\t Line Number: %d\n", yytext, line_num); }

[0-9]+ { printf("Token Class: num%d\t Token Value: \"%d\"\t Line Number: %d\n",  num_count++, atoi(yytext), line_num); }

\"([^\\\"]|\\.)*\" { printf("Token Class: string%d\t Token Value: \"%s\"\t Line Number: %d\n", string_count++, yytext, line_num); }

'\''[^\']'\'' { printf("Token Class: char%d\t Token Value: \"%s\"\t Line Number: %d\n", char_count++, yytext, line_num); }

[+] { printf("Token Class: add-op\t Token Value: \"%s\"\t Line Number: %d\n", yytext, line_num); }
[-] { printf("Token Class: sub-op\t Token Value: \"%s\"\t Line Number: %d\n", yytext, line_num); }
[*] { printf("Token Class: mul-op\t Token Value: \"%s\"\t Line Number: %d\n", yytext, line_num); }
[\\] { printf("Token Class: div-op\t Token Value: \"%s\"\t Line Number: %d\n", yytext, line_num); }

[=] { printf("Token Class: eq-op\t Token Value: \"%s\"\t Line Number: %d\n", yytext, line_num); }

"(" { printf("Token Class: l-paren\t Token Value: \"%s\"\t Line Number: %d\n", yytext, line_num); }
")" { printf("Token Class: r-paren\t Token Value: \"%s\"\t Line Number: %d\n", yytext, line_num); }
"[" { printf("Token Class: l-brack\t Token Value: \"%s\"\t Line Number: %d\n", yytext, line_num); }
"]" { printf("Token Class: r-brack\t Token Value: \"%s\"\t Line Number: %d\n", yytext, line_num); }
"{" { printf("Token Class: l-brace\t Token Value: \"%s\"\t Line Number: %d\n", yytext, line_num); }
"}" { printf("Token Class: r-brace\t Token Value: \"%s\"\t Line Number: %d\n", yytext, line_num); }

[,] { printf("Token Class: comma\t Token Value: \"%s\"\t Line Number: %d\n", yytext, line_num); }
[;] { printf("Token Class: semicolon\t Token Value: \"%s\"\t Line Number: %d\n", yytext, line_num); }

[a-zA-Z_][a-zA-Z0-9_]* { printf("Token Class: id%d\t Token Value: \"%s\"\t Line Number: %d\n", ident_count++, yytext, line_num); }

. { printf("Token Class: access-op\t Token Value: \"%s\"\t Line Number: %d\n", yytext, line_num); }

%%


int yywrap(){
    return 1;
}


int main(){
    yyin = fopen("program.txt", "r");
    if(yylex() == 0){
        printf("\nScan Complete!\n");
    } else {
        printf("\nScan Error!\n");
    }
}
