
/* A Bison parser, made by GNU Bison 2.4.1.  */

/* Skeleton interface for Bison's Yacc-like parsers in C
   
      Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.
   
   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */


/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     DIGIT = 258,
     LETTER = 259,
     ASSIGN_DIALOG = 260,
     PRINT_DIALOG = 261,
     IF = 262,
     ELSE = 263,
     THEN = 264,
     EQ = 265,
     GT = 266,
     LT = 267,
     GE = 268,
     LE = 269,
     NE = 270,
     FOR = 271,
     LPAREN = 272,
     RPAREN = 273,
     SEMICOLON = 274,
     COMMA = 275,
     UMINUS = 276
   };
#endif
/* Tokens.  */
#define DIGIT 258
#define LETTER 259
#define ASSIGN_DIALOG 260
#define PRINT_DIALOG 261
#define IF 262
#define ELSE 263
#define THEN 264
#define EQ 265
#define GT 266
#define LT 267
#define GE 268
#define LE 269
#define NE 270
#define FOR 271
#define LPAREN 272
#define RPAREN 273
#define SEMICOLON 274
#define COMMA 275
#define UMINUS 276




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;


