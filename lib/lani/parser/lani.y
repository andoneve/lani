class Lani::Parser
  token INTEGER
  token FLOAT
  token ADD
  token SUBTRACT
  token MULTIPLY
  token DIVIDE
  token NEWLINE
  token RPAREN
  token LPAREN
  token STRING
  token VARIABLE
  token ASSIGN
  token TRUE
  token FALSE
  token NIL
  token LSQBRA
  token RSQBRA
  token COMMA



  prechigh
    left MULTIPLY DIVIDE
    left ADD SUBTRACT
  preclow

  options no_result_var 
rule
  root : program
  
  program : /* nothing */ { AST::Program.new( filename, lineno, [])}
          | expressions   { AST::Program.new( filename, lineno, val[0])}
  
  number : INTEGER { AST::IntegerNode.new( filename, lineno, val[0])}
         | FLOAT   { AST::FloatNode.new( filename, lineno, val[0])}

  string : STRING { AST::StringNode.new( filename, lineno, val[0])}

  variable : VARIABLE { AST::VariableNode.new( filename, lineno, val[0])}

 
  assignment : variable ASSIGN expression {AST::AssignmentNode.new( filename, lineno, val[0], val[2]) }

  boolean : TRUE { AST::TrueBooleanNode.new( filename, lineno)}
          | FALSE { AST::FalseBooleanNode.new( filename, lineno)}
          | NIL { AST::NilBooleanNode.new( filename, lineno)}

  array : LSQBRA RSQBRA { AST::ArrayNode.new( filename, lineno, [])}
        | LSQBRA expression RSQBRA { AST::ArrayNode.new( filename, lineno, val[1])}
        | LSQBRA expression COMMA expression RSQBRA { AST::ArrayNode.new( filename, lineno, val[1], val[3])}
  


  expression : number
             | binary_operation
             | LPAREN expression RPAREN { val[1] }
             | string
             | variable
             | assignment
             | boolean
             | array
             

  binary_operation : expression ADD expression {AST::AddNode.new( filename, lineno, val[0], val[2])}
                   | expression SUBTRACT expression {AST::SubtractNode.new( filename, lineno, val[0], val[2])}
                   | expression MULTIPLY expression {AST::MultiplyNode.new( filename, lineno, val[0], val[2])}
                   | expression DIVIDE expression {AST::DivideNode.new( filename, lineno, val[0], val[2])}

  expressions : expression { [val[0]] }
              | expressions terminator expression { val[0] << val[2] }

  terminator : NEWLINE

  

end

---- header ----
require_relative 'lexer'

---- inner ----

def filename
  @filename
end

alias_method :parse_string, :scan_str

def pre_exe
  []
end

def on_error(t, val, vstack)
  raise ParseError, sprintf("\nparse error on value %s (%s) #{@filename}:#{@line}",
      val.inspect, token_to_str(t) || '?')
end

---- footer ----