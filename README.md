# jlox

Interpreter for the Lox programming language implemented in Java.  
Implementation of the interpreter follows guidelines provided by the book  
[Crafting Interpreters](https://craftinginterpreters.com/) written by  
Robert Nystorm.

![jlox - sta](https://github.com/user-attachments/assets/9255e8e1-200d-45d4-a796-716c4e079cbe)

## Build and Run

### Dependencies

1. JDK (Java Development Toolkit)
2. Maven

### Steps

1. Clone the repository
```bash
git clone git@github.com:peshala-prabhapoorna/jlox.git
```

2. Move into the root of the repository
```bash
cd jlox
```

3. Build the interpreter
```bash
mvn clean compile
```

4. Run the interpreter
```bash
./jlox
```

### Build Jar File

```bash
mvn clean compile package
```

## grammar

```
program        → declaration* EOF ;
declaration    → varDecl | statement ;
statement      → exprStmt
                | forStmt
                | ifStmt
                | printStmt
                | whileStmt
                | block ;
forStmt        → "for" "(" ( varDecl | exprStmt | ";")
                expression? ";"
                expression? ")" statement ;
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
unary          → ( "!" | "-" ) unary | call ;
call           → primary ( "(" arguments? ")" )* ;
arguments      → expression ( "," expression )* ;
primary        → NUMBER | STRING | "true" | "false" | "nil"
               | "(" expression ")"
               | IDENTIFIER
               // Error productions...
               | ( "!=" | "==" ) equality
               | ( ">" | ">=" | "<" | "<=" ) comparison
               | ( "+" ) term
               | ( "/" | "*" ) factor ;
```
