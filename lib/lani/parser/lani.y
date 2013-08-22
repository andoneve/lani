class Lani::Parser
  token INTEGER
  token FLOAT
  token ADD

  options no_result_var
rule
  root : expression { AST::Script.new(filename, lineno, [val[0]]) }
       | /* none */ { AST::Script.new(filename, lineno) }

  number : INTEGER { AST::IntegerNode.new(filename, lineno, val[0]) }
         | FLOAT   { } # <- figure it out!! :)

  expression :
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