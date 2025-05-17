%option outfile="scanner.c"

%{
    #include <stdio.h>
    #include <string.h>

    #define MAX_IDS 100
    #define MAX_LEN 50
    char ids[MAX_IDS][MAX_LEN];
    int ident_count = 0;
    int add_id(const char *id){
        for(int i = 0; i < ident_count; i++){
            if(strcmp(ids[i], id) == 0){
                return i+1;
            }
        }
        if(ident_count < MAX_IDS){
            strncpy(ids[ident_count], id, MAX_LEN-1);
            ids[ident_count][MAX_LEN-1] = '\0';
            ident_count++;
            return ident_count;
        }
    }

    int line_num = 1;
    int num_count = 1;
    int string_count = 1;
    int char_count = 1;
    extern FILE *yyin;
%}


%%

[ ] { /*Skip Space*/ }
[\n\t\r] { printf(yytext); line_num++;}
[/][*][\s\S]*?[*][/] { /*Skip Comments*/ }

"if" { printf("Token Class: keyword\t Token Value: \"%s\"\t Line Number: %d\n", yytext, line_num); }
"else" { printf("Token Class: keyword\t Token Value: \"%s\"\t Line Number: %d\n", yytext, line_num); }
"for" { printf("Token Class: keyword\t Token Value: \"%s\"\t Line Number: %d\n", yytext, line_num); }

":" { printf("Token Class: colon\t Token Value: \"%s\"\t Line Number: %d\n", yytext, line_num); }

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

"++" { printf("Token Class: inc-op\t Token Value: \"%s\"\t Line Number: %d\n", yytext, line_num); }
"--" { printf("Token Class: dec-op\t Token Value: \"%s\"\t Line Number: %d\n", yytext, line_num); }
"**" { printf("Token Class: exp-op\t Token Value: \"%s\"\t Line Number: %d\n", yytext, line_num); }
"+=" { printf("Token Class: plus-eq-op\t Token Value: \"%s\"\t Line Number: %d\n", yytext, line_num); }
"-=" { printf("Token Class: minus-eq-op\t Token Value: \"%s\"\t Line Number: %d\n", yytext, line_num); }
"*=" { printf("Token Class: mul-eq-op\t Token Value: \"%s\"\t Line Number: %d\n", yytext, line_num); }
"/=" { printf("Token Class: div-eq-op\t Token Value: \"%s\"\t Line Number: %d\n", yytext, line_num); }
"==" { printf("Token Class: eq-op\t Token Value: \"%s\"\t Line Number: %d\n", yytext, line_num); }
"<=" { printf("Token Class: lt-eq-op\t Token Value: \"%s\"\t Line Number: %d\n", yytext, line_num); }
">=" { printf("Token Class: gt-eq-op\t Token Value: \"%s\"\t Line Number: %d\n", yytext, line_num); }
"!=" { printf("Token Class: not-eq-op\t Token Value: \"%s\"\t Line Number: %d\n", yytext, line_num); }
"!" { printf("Token Class: not-op\t Token Value: \"%s\"\t Line Number: %d\n", yytext, line_num); }
"<" { printf("Token Class: lt-op\t Token Value: \"%s\"\t Line Number: %d\n", yytext, line_num); }
">" { printf("Token Class: gt-op\t Token Value: \"%s\"\t Line Number: %d\n", yytext, line_num); }
"+" { printf("Token Class: add-op\t Token Value: \"%s\"\t Line Number: %d\n", yytext, line_num); }
"-" { printf("Token Class: sub-op\t Token Value: \"%s\"\t Line Number: %d\n", yytext, line_num); }
"*" { printf("Token Class: mul-op\t Token Value: \"%s\"\t Line Number: %d\n", yytext, line_num); }
"/" { printf("Token Class: div-op\t Token Value: \"%s\"\t Line Number: %d\n", yytext, line_num); }

"=" { printf("Token Class: assign-op\t Token Value: \"%s\"\t Line Number: %d\n", yytext, line_num); }

"(" { printf("Token Class: l-paren\t Token Value: \"%s\"\t Line Number: %d\n", yytext, line_num); }
")" { printf("Token Class: r-paren\t Token Value: \"%s\"\t Line Number: %d\n", yytext, line_num); }
"[" { printf("Token Class: l-brack\t Token Value: \"%s\"\t Line Number: %d\n", yytext, line_num); }
"]" { printf("Token Class: r-brack\t Token Value: \"%s\"\t Line Number: %d\n", yytext, line_num); }
"{" { printf("Token Class: l-brace\t Token Value: \"%s\"\t Line Number: %d", yytext, line_num); }
"}" { printf("Token Class: r-brace\t Token Value: \"%s\"\t Line Number: %d", yytext, line_num); }

"," { printf("Token Class: comma\t Token Value: \"%s\"\t Line Number: %d\n", yytext, line_num); }
";" { printf("Token Class: semicolon\t Token Value: \"%s\"\t Line Number: %d\n", yytext, line_num); }

[a-zA-Z_][a-zA-Z0-9_]* { int id_index = add_id(yytext); printf("Token Class: id%d\t Token Value: \"%s\"\t Line Number: %d\n", id_index, yytext, line_num); }

"." { printf("Token Class: access-op\t Token Value: \"%s\"\t Line Number: %d\n", yytext, line_num); }

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
