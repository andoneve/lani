class Lani::Parser
macro
  # our macros go here
rule
  # our rules go here
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