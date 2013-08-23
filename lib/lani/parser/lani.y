class Lani::Parser
  token INTEGER
  token FLOAT
  token ADD

  options no_result_var
rule
  root : program
  
  program : { AST::Program.new( filename, lineno, [])}
          | expressions { AST::Program.new( filename, lineno, val[0])}
  

  number : INTEGER { AST::IntegerNode.new( filename, lineno, val[0])}
         | FLOAT { AST::FloatNode.new( filename, lineno, val[0])}

  expression : number

  expressions : expression { [val[0]] }

end

---- header ----
require_relative 'lexer'

---- inner ----

def filename
  @filename
end

def on_error(t, val, vstack)
  raise ParseError, sprintf("\nparse error on value %s (%s) #{@filename}:#{@line}",
      val.inspect, token_to_str(t) || '?')
end

---- footer ----