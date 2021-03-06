//JavaScript expressions module

require "js-lexicals.k"

module JS-EXPRESSIONS
  imports JS-LEXICALS

//EXPRESSIONS - Ecma262-11
  syntax Expression ::= PrimaryExpression
		     |  LeftHandSideExpression
		     |  PostfixExpression
		     |  UnaryExpression
		     |  MultiplicativeExpression
		     |  AdditiveExpression
		     |  ShiftExpression
		     |  RelationalExpression
		     |  EqualityExpression
		     |  BitwiseANDExpression
		     |  BitwiseANDExpressionNoIn
		     |  BitwiseXORExpression
		     |  BitwiseXORExpressionNoIn
		     |  BitwiseORExpression
		     |  BitwiseORExpressionNoIn
		     |  LogicalANDExpression
		     |  LogicalANDExpressionNoIn
		     |  LogicalORExpression
		     |  LogicalORExpressionNoIn
		     |  ConditionalExpression // ? :
		     |  ConditionalExpressionNoIn
		     |  AssignmentExpression
		     |  AssignmentExpressionNoIn
		     |  CommaOperator
//----------------------------------------

//Primary Expressions - Ecma262-11.1
  syntax PrimaryExpression ::= "this"  // thisKeyword
			    |  Identifier  // IdentifierReference
			    |  Literal  // LiteralReference
			    |  ArrayLiteral  // ArrayInitializer
			    |  ObjectLiteral  // ObjectInitializer
			    |  "(" Expression ")"  // GroupingOperator
//----------------------------------------

//Array Initializer - Ecma262-11.1.4
  syntax ArrayLiteral ::= "[" "]"
		       |  "[" Elision "]"
		       |  "[" ElementList "]"
		       |  "[" ElementList "," Elision "]"
		       |  "[" ElementList "," "]"

  syntax ElementList ::= Elision AssignmentExpression
		      |  AssignmentExpression
		      |  ElementList "," Elision AssignmentExpression
		      |  ElementList "," AssignmentExpression

  syntax Elision ::= ","
		  |  Elision ","
//----------------------------------------

//Object Initializer - Ecma262-11.1.5
  syntax ObjectLiteral ::= "{" "}"
			|  "{" PropertyNameAndValueList "}"
			|  "{" PropertyNameAndValueList "," "}"

  syntax PropertyNameAndValueList ::= PropertyAssignment
				   |  PropertyNameAndValueList "," PropertyAssignment

  syntax PropertyAssignment ::= PropertyName ":" AssignmentExpression
//			     |  "get" PropertyName "(" ")" "{" FunctionBody "}"
//			     |  "set" PropertyName "(" PropertySetParameterList ")" "{" FunctionBody "}"

  syntax PropertyName ::= IdentifierName
		       |  StringLiteral
		       |  NumericLiteral

  syntax PropertySetParameterList ::= Identifier
//----------------------------------------



//Left-Hand-Side Expressions - Ecma262-11.2
  syntax LeftHandSideExpression ::= NewExpression
				 |  CallExpression

  syntax NewExpression ::= MemberExpression
			|  "new" NewExpression

  syntax CallExpression ::= MemberExpression Arguments
			 |  CallExpression Arguments
			 |  CallExpression "[" Expression "]"
			 |  CallExpression "." IdentifierName

  syntax MemberExpression ::= PrimaryExpression
	//		   |  FunctionExpression
			   |  MemberExpression "[" Expression "]"
			   |  MemberExpression "." IdentifierName
			   |  "new" MemberExpression Arguments

  syntax Arguments ::= "(" ")"
		    |  "(" ArgumentList ")"

  syntax ArgumentList ::= AssignmentExpression
		       |  ArgumentList "," AssignmentExpression
//----------------------------------------


//Postfix Expressions - Ecma262-11.3
  syntax PostfixExpression ::= LeftHandSideExpression
			    |  LeftHandSideExpression /*No line terminator here*/ "++"
			    |  LeftHandSideExpression /*No line terminator here*/ "--"
//----------------------------------------



//Unary Operators - Ecma262-11.4
  syntax UnaryExpression ::= PostfixExpression
			  |  "delete" UnaryExpression
			  |  "void" UnaryExpression
			  |  "typeof" UnaryExpression
			  |  "++" UnaryExpression
			  |  "--" UnaryExpression
			  |  "+" UnaryExpression
			  |  "-" UnaryExpression
			  |  "~" UnaryExpression
			  |  "!" UnaryExpression
//----------------------------------------

//Multiplicative Operators - Ecma262-11.5
  syntax MultiplicativeExpression ::= UnaryExpression
				   |  MultiplicativeExpression "*" UnaryExpression
				   |  MultiplicativeExpression "/" UnaryExpression
				   |  MultiplicativeExpression "%" UnaryExpression
//----------------------------------------

//Additive Operators - Ecma262-11.6
  syntax AdditiveExpression ::= MultiplicativeExpression
			     |  AdditiveExpression "+" MultiplicativeExpression
			     |  AdditiveExpression "-" MultiplicativeExpression
//----------------------------------------

//Bitwise Shift Operators - Ecma262-11.7
  syntax ShiftExpression ::= AdditiveExpression
			  |  ShiftExpression "<<" AdditiveExpression
			  |  ShiftExpression ">>" AdditiveExpression
			  |  ShiftExpression ">>>" AdditiveExpression
//----------------------------------------

//Relational Operators - Ecma262-11.8
  syntax RelationalExpression ::= ShiftExpression
			       |  RelationalExpression "<" ShiftExpression
			       |  RelationalExpression ">" ShiftExpression
			       |  RelationalExpression "<=" ShiftExpression
			       |  RelationalExpression ">=" ShiftExpression
			       |  RelationalExpression "instanceof" ShiftExpression
			       |  RelationalExpression "in" ShiftExpression

  syntax RelationalExpressionNoIn ::= ShiftExpression
			     	   |  RelationalExpressionNoIn "<" ShiftExpression
				   |  RelationalExpressionNoIn ">" ShiftExpression
				   |  RelationalExpressionNoIn "<=" ShiftExpression
				   |  RelationalExpressionNoIn ">=" ShiftExpression
				   |  RelationalExpressionNoIn "instanceof" ShiftExpression
//----------------------------------------

//Equality Operators - Ecma262-11.9
  syntax EqualityExpression ::= RelationalExpression
			     |  EqualityExpression "==" RelationalExpression
			     |  EqualityExpression "!=" RelationalExpression
			     |  EqualityExpression "===" RelationalExpression
			     |  EqualityExpression "!==" RelationalExpression

  syntax EqualityExpressionNoIn ::= RelationalExpressionNoIn
				 |  EqualityExpressionNoIn "==" RelationalExpressionNoIn
				 |  EqualityExpressionNoIn "!=" RelationalExpressionNoIn
				 |  EqualityExpressionNoIn "===" RelationalExpressionNoIn
				 |  EqualityExpressionNoIn "!==" RelationalExpressionNoIn
//----------------------------------------

//Binary Bitwise Operators - Ecma262-11.10
  syntax BitwiseANDExpression ::= EqualityExpression
			       |  BitwiseANDExpression "&" EqualityExpression

  syntax BitwiseANDExpressionNoIn ::= EqualityExpressionNoIn
				   |  BitwiseANDExpressionNoIn "&" EqualityExpressionNoIn

  syntax BitwiseXORExpression ::= BitwiseANDExpression
			       |  BitwiseXORExpression "^" BitwiseANDExpression

  syntax BitwiseXORExpressionNoIn ::= BitwiseANDExpressionNoIn
				   |  BitwiseXORExpressionNoIn "^" BitwiseANDExpressionNoIn

  syntax BitwiseORExpression ::= BitwiseXORExpression
			      |  BitwiseORExpression "|" BitwiseXORExpression

  syntax BitwiseORExpressionNoIn ::= BitwiseXORExpressionNoIn
				  |  BitwiseORExpressionNoIn "|" BitwiseXORExpressionNoIn
//----------------------------------------

//Binary Logical Operators - Ecma262-11.11
  syntax LogicalANDExpression ::= BitwiseORExpression
			       |  LogicalANDExpression "&&" BitwiseORExpression

  syntax LogicalANDExpressionNoIn ::= BitwiseORExpressionNoIn
				   |  LogicalANDExpressionNoIn "&&" BitwiseORExpressionNoIn

  syntax LogicalORExpression ::= LogicalANDExpression
			       |  LogicalORExpression "||" LogicalANDExpression

  syntax LogicalORExpressionNoIn ::= LogicalANDExpressionNoIn
				  |  LogicalORExpressionNoIn "||" LogicalANDExpressionNoIn
//----------------------------------------

//Conditional Operator ( ? : ) - Ecma262-11.12
  syntax ConditionalExpression ::= LogicalORExpression
				|  LogicalORExpression "?" AssignmentExpression ":" AssignmentExpression

  syntax ConditionalExpressionNoIn ::= LogicalORExpressionNoIn
				    |  LogicalORExpressionNoIn "?" AssignmentExpression ":" AssignmentExpressionNoIn
//----------------------------------------

//Assignment Operators - Ecma262-11.13
  syntax AssignmentExpression ::= ConditionalExpression
			       |  LeftHandSideExpression "=" AssignmentExpression
			       |  LeftHandSideExpression AssignmentOperator AssignmentExpression

  syntax AssignmentExpressionNoIn ::= ConditionalExpressionNoIn
				   |  LeftHandSideExpression "=" AssignmentExpressionNoIn
				   |  LeftHandSideExpression AssignmentOperator AssignmentExpressionNoIn

  syntax AssignmentOperator ::= "*="
			     |  "/="
			     |  "%="
			     |  "+="
			     |  "-="
			     |  "<<="
			     |  ">>="
			     |  ">>>="
			     |  "&="
			     |  "^="
			     |  "|="
//----------------------------------------

//Comma Operator ( , ) - Ecma262-11.14
//TODO: make sure you're handling it right
//	no ExpressionNoIn before -- is it ok to declare it here?
  syntax CommaOperator ::= AssignmentExpression
			|  Expression "," AssignmentExpression

  syntax ExpressionNoIn ::= AssignmentExpressionNoIn
			 |  ExpressionNoIn "," AssignmentExpressionNoIn
//----------------------------------------



endmodule
