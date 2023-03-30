%{

#include <stdio.h>
#include "y.tab.h"
int c;
extern int yylval;
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
{ELSE}          { return ELSE; }
{THEN}          { return THEN; }
{WHILE}         { return WHILE; }
{EQ}            { return EQ; }
{GT}            { return GT; }
{LT}            { return LT; }
{GE}            { return GE; }
{IF}            { return IF; }
{LE}            { return LE; }
{NE}            { return NE; }
{EOF}           { return 0; }
{ASSIGN_DIALOG}         {return ASSIGN_DIALOG ;}
{PRINT_DIALOG}          {return PRINT_DIALOG;  }

"/*"([^*]|[\r\n]|(\*+([^*/]|[\r\n])))*\*+"/"        { }

"//"(.)*\n              { }

"likhke de-"(.)*\n     {yylval = strdup(yytext + 11);
                          return SENTENCE;
                        }

[A-Za-z]+               {
                            c = yytext[0];
                            yylval = c - 'a';
                            return(LETTER);
                        }

[0-9]                   {
                            c = yytext[0];
                            yylval = c - '0';
                            return(DIGIT);
                        }

[^a-z0-9\b]             {
                            c = yytext[0];
                            return(c);
                        }
\n                      {}
%%
