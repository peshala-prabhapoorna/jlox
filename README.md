# jlox
Interpreter for the Lox programming language implemented in Java.  
Implementation of the interpreter follows guidelines provided by the book  
[Crafting Interpreters](https://craftinginterpreters.com/) written by  
Robert Nystorm.
![jlox - sta](https://github.com/user-attachments/assets/9255e8e1-200d-45d4-a796-716c4e079cbe)
## grammar
```
program        → declaration* EOF ;
declaration    → varDecl | statement ;
statement      → exprStmt | ifStmt | printStmt | whileStmt | block ;
block          → "{" declaration* "}" ;
varDecl        → "var" IDENTIFIER ( "=" expression )? ";" ;
exprStmt       → expression ";" ;
ifStmt         → "if" "(" expression ")" statement ( "else" statement )? ;
printStmt      → "print" expression ";" ;
whileStmt      → "while" "(" expression ")" statement ;
expression     → assignment ;
assignment     → IDENTIFIER "=" assignment | comma ;
comma          → conditional ( "," conditional )* ;
conditional    → logic_or ( "?" expression ":" conditional )? ;
logic_or       → logic_and ( "or" logic_and )* ;
logic_and      → equality ( "and" equality )* ;
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
