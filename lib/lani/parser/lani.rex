class Lani::Parser
macro
  #macros go here
rule
  \d+\.\d+    { [:FLOAT, text.to_f] }
  \d+     { [:INTEGER, text.to_i] }
  \+      { [:ADD, text] }
  \-      { [:SUBTRACT, text] }
  \=      { [:ASSIGN, text] }
  \*      { [:MULTIPLY, text] }
  \/      { [:DIVIDE, text] }
  \(      { [:LPAREN, text]}
  \)      { [:RPAREN, text]}
  \n      { [:NEWLINE, text]}
  \"[^"]*"   { [:STRING, text]}
  \[a-z_]*  { [:VARIABLE, text]}
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