grammar ifcc;

axiom : prog       
      ;

prog : 'int' 'main' '(' ')' '{' list_expr myreturn '}' ;

list_expr : expr*;

expr : 'int' VAR '=' val ';'  	    # declaration
	 ;


val : CONST		# getConst
	| VAR		# getVAR
	; 

myreturn : 'return' val ';'	# myReturn
         ;


VAR : [a-zA-Z][a-zA-Z0-9]* ;
CONST : [0-9]+ ;
COMMENT : '/*' .*? '*/' -> skip ;
DIRECTIVE : '#' .*? '\n' -> skip ;
WS    : [ \t\r\n] -> channel(HIDDEN);
