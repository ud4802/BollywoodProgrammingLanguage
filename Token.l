%{

#include <stdio.h>
int c;

%}


IF              "agar tum chaho to yeh"
ELSE            "varana"
THEN            "bhi ek such ban jaye"
WHILE           "jab tak hai"
EQ              "hum tum ek hai"
GT              "bade miya"
LT              "chote miya"
GE              "tum jesa or tum se bade"
LE              "tum jesa or tum se chote"
NE              "hamari barabari ke nahi ho"
EOF             "bas 10 number ho gaya"
ASSIGN_DIALOG   "value bole to"
PRINT_DIALOG    "likhke de"




%%

" "             ;
\n              {}
{ELSE}          { printf("%s----------------else\n",yytext); }
{THEN}          { printf("%s----------------then\n",yytext); }
{WHILE}         { printf("%s----------------while\n",yytext); }
{EQ}            { printf("%s----------------==\n",yytext); }
{GT}            { printf("%s---------------->\n",yytext); }
{LT}            { printf("%s----------------<\n",yytext); }
{GE}            { printf("%s---------------->=\n",yytext); }
{IF}            { printf("%s----------------if\n",yytext); }
{LE}            { printf("%s----------------<=\n",yytext); }
{NE}            { printf("%s----------------!=\n",yytext);}
{EOF}           { printf("%s----------------eof\n",yytext);return 0; }
{ASSIGN_DIALOG}         {printf("%s----------------assign dialog\n",yytext);}
{PRINT_DIALOG}          {printf("%s----------------print dialog\n",yytext);}
[+*/=-]              {printf("%s----------------operator\n",yytext);}

"/*"([^*]|[\r\n]|(\*+([^*/]|[\r\n])))*\*+"/"        {printf("%s----------------multi line comment\n",yytext); }

"//"(.)*\n              {printf("%s---------------- single line comment\n",yytext); }

"likhke de-"(.)*\n     {
                          printf("%s---------------- printf statement\n",yytext);
                        }

[A-Za-z]+               {
                            
                            printf("%s----------------Variable\n",yytext);
                        }

[0-9]                   {
                            
                            printf("%s---------------- Digit\n",yytext);
                        }


%%



int yywrap(){}
int main(){
yylex();

 
return 0;
}