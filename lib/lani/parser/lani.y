class Lani::Parser
  token INTEGER
  token FLOAT

  options no_result_var
rule
  root : number
       | /* none */ { nil }

  number : INTEGER { val[0] }
         | FLOAT   { val[0] }
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