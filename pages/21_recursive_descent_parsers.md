# Recursive Descent Parsers

## Backus-Naur Form Grammars

BNF for short (technically the following is a variation of BNF)

Consider an arithmetic expression in sexp form:
* 3
* ( + 1 2 )
* ( - ( * 3 4 5 ) 6 )

They have a regular format which can be described by a BNF grammar

```c++
<arithmetic expression> :== <numerical expression> | <parenthesized expression>
<parenthesized expression> :== "(" <operator> <operand list> ")"
<operator> :== "+" | "-" | "*" | "/"
<operand list> :== <arithmetic expression> <arithmetic expression>+
```

Note:

* Suffix + denotes 1 or more
* Suffix * denotes 0 or more

This grammar is recursive! We can easily write a recursive descent parser to parse arithmetic expressions

* To evaluate them
* To build an expression tree
* Etc.

## Let's build an AE Tree

```c++
AENode* parse_arithmetic_expression(iter<string> &token, iter<string> end){
    if(*token == "(")
        return parse_parenthesized_expression(++token, end);
    else
        return parse_numeric_expression(token, end);
}

AENode* parse_numeric_expression(iter<string> &token, iter<string> end){
    double value = std::stod(*token++);
    return new Numeric_Node(value);
}

AENode* parse_parenthesized_expression(iter<string> &token, iter<string> end){
    string operator = *token;
    list <AENode*> list;
    while(*token != ")"){
        list.push_back(parse_arithmetic_expression(token, end));
    }
    ++token; //step over closing parenthesis
    if(operator == "+") return new Plus_Node(list);
    else if (operator == "-") return new Minus_Node(list);
    else if (operator == "*") return new Multiply_Node(list);
    else if (operator == "/") return new Divide_Node(list);
}
```