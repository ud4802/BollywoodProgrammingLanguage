%{
#include <stdio.h>
#include <string.h>
#include <stdbool.h> 

#include <ctype.h>   // for isdigit and isspace functions
int regs[260];
int base;
%}
%start list
%token DIGIT LETTER ASSIGN_DIALOG PRINT_DIALOG IF ELSE THEN EQ GT LT GE LE NE SENTENCE WHILE
%left '|'
%left '&'
%left '+' '-'
%left '*' '/' '%'
%left UMINUS  /*supplies precedence for unary minus */
%left '=' '"'
%%                   /* beginning of rules section */
list:                       /*empty */
         |
        list stat '\n'
         |
        list error '\n'
         {
           yyerrok;
         }
         ;
         
stat:    SENTENCE 
         expr
         {
           printf("ruko jaraa sabar karo, batata hu tumara jawaab..! %d\n",$1);
         }
         |
         {
            printf("%s\n",$1);
         }
         |

         WHILE number THEN stat
         {
            int i=$2;
            while(i>0){
                $$=$4;
                // $4=eval_expr($4);
                // yypush_buffer_state(yy_scan_string($4)); // set up a new input buffer for the loop body
                // yyparse(); // parse the loop body
                // yypop_buffer_state();
                printf("%d",$4);
                i=i-1;
            }
         }
         |
         ASSIGN_DIALOG LETTER '=' expr
         {
           regs[$2] = $4;
         }
       
         ;
expr:    '(' expr ')'
         {
           $$ = $2;
         }
         |
         
         expr '*' expr
         {
           $$ = $1 * $3;
         }
         |
         expr '/' expr
         {
           $$ = $1 / $3;
         }
         |
         expr '%' expr
         {
           $$ = $1 % $3;
         }
         |
         expr '+' expr
         {
           $$ = $1 + $3;
         }
          |
         expr '-' expr
         {
           $$ = $1 - $3;
         }
         |
         expr '&' expr
         {
           $$ = $1 & $3;
         }
         |
         expr '|' expr
         {
           $$ = $1 | $3;
         }
         |
        '-' expr %prec UMINUS
         {
           $$ = -$2;
         }
         |
         
         LETTER '='  expr '*' expr
         {
           regs[$1] = $3 * $5;
           $$= regs[$1];
         }
         |
         LETTER '=' expr '/' expr
         {
           regs[$1] = $3 / $5;
           $$=regs[$1];
         }
         |
         LETTER '=' expr '%' expr
         {
           regs[$1] = $3 % $5;
           $$=regs[$1];
         }
         |
         LETTER '=' expr '+' expr
         {
          regs[$1] = $3 + $5;
           $$=regs[$1];
         }
          |
         LETTER '=' expr '-' expr
         {
           regs[$1] = $3 - $5;
           $$=regs[$1];
         }
         |
         LETTER '=' expr '&' expr
         {
          regs[$1] = $3 & $5;
           $$=regs[$1];
         }
         |
         LETTER '=' expr '|' expr
         {
           regs[$1] = $3 | $5;
           $$=regs[$1];
         }
         |
         expr GT expr
         {
           $$ = $1 > $3;
           
         }
         |
         expr LT expr
         {
           $$ = $1 < $3;
         }
         |
         expr EQ expr
         {
           $$ = $1== $3;
         }
         |
         expr LE expr
         {
           $$ = $1 <= $3;
         }
         |
         expr GE expr
         {
           $$ = $1 >= $3;
         }
         |
         expr NE expr
         {
           $$ = $1 != $3;
         }
         |
         PRINT_DIALOG LETTER
         {
           $$ = regs[$2];
         }
         |
         number

         |

        IF expr THEN expr ELSE expr
         {
            
           if ($2) {
           
             $$ = $4;
           } else {
             $$ = $6;
           }
         }
        |

         IF expr THEN expr
         {
            
           if ($2) {
           
             $$ = $4;
           }
           else{
            printf("khopdi tod saale ka");
           }
         }

         |
         LETTER
         {
            $$=regs[$1];
         }
         ;


number:  DIGIT
         {
           $$ = $1;
           base = ($1==0) ? 8 : 10;
         }       |
         number DIGIT
         {
           $$ = base * $1 + $2;
         }
         ;
%%
main()
{
 return(yyparse());
}
yyerror(s)
char *s;
{
  printf("Bhari mistake ho gaya ....!\n");
}
yywrap()
{
  return(1);
}
