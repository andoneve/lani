class Lani::Parser
macro
  #macros go here
rule

# Literals
  \d+\.\d+   { [:FLOAT, text.to_f] }
  \d+        { [:INTEGER, text.to_i] }
  \"[^"]+"   { [:STRING, text[1..-2]]}

  #Keywords
  true    { [:TRUE, true]}
  false   { [:FALSE, false]}
  nil     { [:NIL, nil]}

# Identifier
  [a-z_]+  { [:IDENTIFIER, text]}

# Operators
  \+      { [:ADD, text] }
  \->     { [:FN, text]}
  \-      { [:SUBTRACT, text] }
  \*      { [:MULTIPLY, text] }
  \/      { [:DIVIDE, text] }
  \(      { [:LPAREN, text]}
  \)      { [:RPAREN, text]}
  \=>     { [:ROCKET, text]}
  \=      { [:ASSIGN, text]}
  \[      { [:LSQBRA, text]}
  \]      { [:RSQBRA, text]}
  \{      { [:LCBRA, text]}
  \}      { [:RCBRA, text]}
  \,      { [:COMMA, text]}



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