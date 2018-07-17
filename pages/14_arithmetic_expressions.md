# Arithmetic Expressions

## Infix notation

Operators are positioned between the values they combine

* 1 + 2 + 3 + 4

Without operator precedence rules, we can wind up with ambiguous expressions:

* 3 + 4 * 5

Without operator precedence rules, we need parenthesis to override them:

* (3 + 4) * 5

An operator is applied to its first operand

## Prefix notation

Aka, Polish notation (because its creator was a Polish mathematician)

Operators are positioned before the values they combine. An operator is applied to its first operand.

Goal: is to represent arithmetic expressions unambiguously without resorting to precedence rules or parenthesis

* \+ + + 1 2 3 4
* \+ 3 * 4 5
* \* + 3 4 5

## Postfix Notation
Aka, Reverse Polish Notation (RPN)

Operators are positioned after the values they combine. An operator is applied to its first operand

Goal: to represent arithmetic expressions unambiguously without resorting to precedence rules or parenthesis

Note: it is not really Polished Notation reversed

| Prefix (PN) | Postfix (RPN) | Value |
| ----------- | ------------- | ----- |
| / 100 5     | 100 5 /       | 20    |
| / 5 100     | 5 100 /       | 0.05  |

## Cambridge Polish Notation
Aka symbolic expressions - sexps for short

A variant of prefix notation used by LISP-like languages. All expressions are fully parenthesized, with the first element of an executable form being an operator (or the name of a function, macro, or special form). For example, the expression written as 1 + 2 * 3 - 4 in the traditional infix notation is written as ( - ( + 1 ( * 2 3 ) ) 4 )

Operators are positioned before the values they combine. An operator is applied to its first operand with successive values from the operand list.

## Notation example summary
| Infix                 | Prefix                         | Postfix                        | Sexp              |
| --------------------- | ------------------------------ | ------------------------------ | ----------------- |
| ( ( 1 + 2 ) + 3 ) + 4 | + + + 1 2 3 4 OR + 4 + 3 + 1 2 | 4 3 1 2 + + + OR 1 2 + 3 + 4 + | ( + 1 2 3 4 )     |
| 3 + ( 4 * 5 )         | + 3 * 4 5                      | 3 4 5 * +                      | ( + 3 ( * 4 5 )   |
| ( 3 + 4 ) * 5         | * + 3 4 5                      | 3 4 + 5 *                      | ( * ( + 3 4 ) 5 ) |
