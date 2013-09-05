class Lani::Parser
macro
  #macros go here
rule

# Literals
  \d+\.\d+   { [:FLOAT, text.to_f] }
  \d+        { [:INTEGER, text.to_i] }
  \"[^"]+"   { [:STRING, text]}

  #Keywords
  true    { [:TRUE, text]}
  false   { [:FALSE, text]}
  nil     { [:NIL, text]}

# Identifier
  [a-z_]+  { [:VARIABLE, text]}

# Operators
  \+      { [:ADD, text] }
  \-      { [:SUBTRACT, text] }
  \*      { [:MULTIPLY, text] }
  \/      { [:DIVIDE, text] }
  \(      { [:LPAREN, text]}
  \)      { [:RPAREN, text]}
  \=      { [:ASSIGN, text]}



# NewLines
  \n      { [:NEWLINE, text]}
  
# CatchAll
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