# jlox
Interpreter for the Lox programming language implemented in Java.  
Implementation of the interpreter follows guidelines provided by the book  
[Crafting Interpreters](https://craftinginterpreters.com/) written by  
Robert Nystorm.
## grammar
```
program        → declaration* EOF ;
declaration    → varDecl | statement ;
statement      → exprStmt | printStmt | block ;
block          → "{" declaration* "}" ;
varDecl        → "var" IDENTIFIER ("=" expression)? ";" ;
exprStmt       → expression ";" ;
printStmt      → "print" expression ";" ;
expression     → assignment ;
assignment     → IDENTIFIER "=" assignment | comma ;
comma          → conditional ( "," conditional )* ;
conditional    → equality ( "?" expression ":" conditional )? ;
equality       → comparison ( ( "!=" | "==" ) comparison )* ;
comparison     → term ( ( ">" | ">=" | "<" | "<=" ) term )* ;
term           → factor ( ( "-" | "+" ) factor )* ;
factor         → unary ( ( "/" | "*" ) unary )* ;
unary          → ( "!" | "-" ) unary
               | primary ;
primary        → NUMBER | STRING | "true" | "false" | "nil"
               | "(" expression ")"
               | IDENTIFIER
               // Error productions...
               | ( "!=" | "==" ) equality
               | ( ">" | ">=" | "<" | "<=" ) comparison
               | ( "+" ) term
               | ( "/" | "*" ) factor ;
```
