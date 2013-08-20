class Lani::Parser
macro
  #macros go here
rule
  \d+\D\d+    { [:FLOAT, text.to_f] }
  \d+     { [:INTEGER, text.to_i] }
  \+      { [:ADD, text] }
  \-      { [:SUBTRACT, text] }
  \*      { [:MULTIPLY, text] }
  \/      { [:DIVIDE, text] }
  \(      { [:LPAREN, text]}
  \)      { [:RPAREN, text]}

  .       # no action
  
inner
  # here we put any ruby code we want to extend our lexer with.
  # for example, our own tokenize method.
  def tokenize(code)
    scan_setup(code)
    tokens = []
    while token = next_token
      tokens << token
    end
    tokens
  end
end