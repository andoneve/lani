#
# DO NOT MODIFY!!!!
# This file is automatically generated by Racc 1.4.9
# from Racc grammer file "".
#

require 'racc/parser.rb'

require_relative 'lexer'

module Lani
  class Parser < Racc::Parser

module_eval(<<'...end lani.y/module_eval...', 'lani.y', 98)

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

...end lani.y/module_eval...
##### State transition tables begin ###

racc_action_table = [
     4,     5,    42,    43,    40,    41,    42,    43,    16,     6,
     7,    27,     8,     9,    10,    11,    25,    12,     4,     5,
    13,    51,    49,    63,    27,    50,    16,     6,     7,    27,
     8,     9,    10,    11,    29,    12,     4,     5,    13,    53,
    38,    66,    28,    54,    16,     6,     7,    36,     8,     9,
    10,    11,    44,    12,    32,    47,    13,     4,     5,    65,
    48,    40,    41,    42,    43,    16,     6,     7,   nil,     8,
     9,    10,    11,   nil,    12,     4,     5,    13,    40,    41,
    42,    43,   nil,    16,     6,     7,   nil,     8,     9,    10,
    11,   nil,    12,     4,     5,    13,    40,    41,    42,    43,
   nil,    16,     6,     7,   nil,     8,     9,    10,    11,   nil,
    12,     4,     5,    13,    40,    41,    42,    43,   nil,    16,
     6,     7,   nil,     8,     9,    10,    11,   nil,    12,     4,
     5,    13,    40,    41,    42,    43,   nil,    16,     6,     7,
   nil,     8,     9,    10,    11,   nil,    12,     4,     5,    13,
    40,    41,    42,    43,   nil,    16,     6,     7,   nil,     8,
     9,    10,    11,   nil,    12,     4,     5,    13,    42,    43,
   nil,   nil,   nil,    16,     6,     7,   nil,     8,     9,    10,
    11,   nil,    12,     4,     5,    13,   nil,   nil,   nil,   nil,
   nil,    16,     6,     7,   nil,     8,     9,    10,    11,   nil,
    12,     4,     5,    13,   nil,   nil,   nil,   nil,   nil,    16,
     6,     7,   nil,     8,     9,    10,    11,   nil,    12,     4,
     5,    13,   nil,   nil,   nil,   nil,   nil,    16,     6,     7,
   nil,     8,     9,    10,    11,   nil,    12,     4,     5,    13,
   nil,   nil,   nil,   nil,   nil,    16,     6,     7,   nil,     8,
     9,    10,    11,   nil,    12,     4,     5,    13,   nil,   nil,
   nil,   nil,   nil,    16,     6,     7,   nil,     8,     9,    10,
    11,   nil,    12,   nil,   nil,    13,    40,    41,    42,    43,
   nil,    55 ]

racc_action_check = [
     0,     0,    56,    56,    35,    35,    35,    35,     0,     0,
     0,    52,     0,     0,     0,     0,     1,     0,    11,    11,
     0,    35,    33,    52,     3,    33,    11,    11,    11,    64,
    11,    11,    11,    11,    11,    11,    12,    12,    11,    37,
    13,    64,     7,    37,    12,    12,    12,    13,    12,    12,
    12,    12,    25,    12,    12,    30,    12,    16,    16,    54,
    30,    24,    24,    24,    24,    16,    16,    16,   nil,    16,
    16,    16,    16,   nil,    16,    26,    26,    16,    31,    31,
    31,    31,   nil,    26,    26,    26,   nil,    26,    26,    26,
    26,   nil,    26,    28,    28,    26,    45,    45,    45,    45,
   nil,    28,    28,    28,   nil,    28,    28,    28,    28,   nil,
    28,    36,    36,    28,    46,    46,    46,    46,   nil,    36,
    36,    36,   nil,    36,    36,    36,    36,   nil,    36,    40,
    40,    36,    60,    60,    60,    60,   nil,    40,    40,    40,
   nil,    40,    40,    40,    40,   nil,    40,    41,    41,    40,
    62,    62,    62,    62,   nil,    41,    41,    41,   nil,    41,
    41,    41,    41,   nil,    41,    42,    42,    41,    57,    57,
   nil,   nil,   nil,    42,    42,    42,   nil,    42,    42,    42,
    42,   nil,    42,    43,    43,    42,   nil,   nil,   nil,   nil,
   nil,    43,    43,    43,   nil,    43,    43,    43,    43,   nil,
    43,    48,    48,    43,   nil,   nil,   nil,   nil,   nil,    48,
    48,    48,   nil,    48,    48,    48,    48,   nil,    48,    50,
    50,    48,   nil,   nil,   nil,   nil,   nil,    50,    50,    50,
   nil,    50,    50,    50,    50,   nil,    50,    51,    51,    50,
   nil,   nil,   nil,   nil,   nil,    51,    51,    51,   nil,    51,
    51,    51,    51,   nil,    51,    53,    53,    51,   nil,   nil,
   nil,   nil,   nil,    53,    53,    53,   nil,    53,    53,    53,
    53,   nil,    53,   nil,   nil,    53,    39,    39,    39,    39,
   nil,    39 ]

racc_action_pointer = [
    -2,    16,   nil,    16,   nil,   nil,   nil,    29,   nil,   nil,
   nil,    16,    34,    28,   nil,   nil,    55,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,    57,    52,    73,   nil,    91,   nil,
    37,    74,   nil,     2,   nil,     0,   109,    20,   nil,   272,
   127,   145,   163,   181,   nil,    92,   110,   nil,   199,   nil,
   217,   235,     3,   253,    47,   nil,    -4,   162,   nil,   nil,
   128,   nil,   146,   nil,    21,   nil,   nil ]

racc_action_default = [
    -2,   -42,    -1,    -3,    -4,    -5,    -6,    -7,    -9,   -10,
   -11,   -42,   -42,   -42,   -25,   -26,   -42,   -28,   -29,   -30,
   -31,   -32,   -33,   -34,   -39,   -42,   -42,   -41,   -42,   -12,
   -42,   -14,   -16,   -42,   -18,   -42,   -42,   -42,   -23,   -42,
   -42,   -42,   -42,   -42,    67,   -40,    -8,   -13,   -42,   -17,
   -42,   -42,   -42,   -42,   -42,   -27,   -35,   -36,   -37,   -38,
   -15,   -19,   -20,   -21,   -42,   -24,   -22 ]

racc_goto_table = [
     3,    31,    35,     1,    34,     2,    39,    30,    33,    37,
   nil,   nil,   nil,   nil,   nil,   nil,    45,   nil,    46,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
    56,    57,    58,    59,   nil,   nil,    52,   nil,    60,   nil,
    35,    62,    61,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,    64 ]

racc_goto_check = [
     3,     8,     8,     1,    14,     2,     8,    11,    13,    16,
   nil,   nil,   nil,   nil,   nil,   nil,     8,   nil,     8,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
     8,     8,     8,     8,   nil,   nil,     3,   nil,     8,   nil,
     8,     8,    14,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,     3 ]

racc_goto_pointer = [
   nil,     3,     5,     0,   nil,   nil,   nil,   nil,   -10,   nil,
   nil,    -4,   nil,    -4,    -8,   nil,    -4,   nil,   nil ]

racc_goto_default = [
   nil,   nil,   nil,   nil,    14,    17,    18,    19,    24,    20,
    21,   nil,    22,   nil,   nil,    23,   nil,    15,    26 ]

racc_reduce_table = [
  0, 0, :racc_error,
  1, 25, :_reduce_none,
  0, 26, :_reduce_2,
  1, 26, :_reduce_3,
  1, 28, :_reduce_4,
  1, 28, :_reduce_5,
  1, 29, :_reduce_6,
  1, 30, :_reduce_7,
  3, 31, :_reduce_8,
  1, 33, :_reduce_9,
  1, 33, :_reduce_10,
  1, 33, :_reduce_11,
  2, 34, :_reduce_12,
  3, 34, :_reduce_13,
  1, 35, :_reduce_14,
  3, 35, :_reduce_15,
  2, 36, :_reduce_16,
  3, 36, :_reduce_17,
  1, 37, :_reduce_none,
  3, 37, :_reduce_19,
  3, 38, :_reduce_20,
  4, 39, :_reduce_21,
  5, 39, :_reduce_22,
  1, 40, :_reduce_23,
  3, 40, :_reduce_24,
  1, 32, :_reduce_none,
  1, 32, :_reduce_none,
  3, 32, :_reduce_27,
  1, 32, :_reduce_none,
  1, 32, :_reduce_none,
  1, 32, :_reduce_none,
  1, 32, :_reduce_none,
  1, 32, :_reduce_none,
  1, 32, :_reduce_none,
  1, 32, :_reduce_none,
  3, 41, :_reduce_35,
  3, 41, :_reduce_36,
  3, 41, :_reduce_37,
  3, 41, :_reduce_38,
  1, 27, :_reduce_39,
  3, 27, :_reduce_40,
  1, 42, :_reduce_none ]

racc_reduce_n = 42

racc_shift_n = 67

racc_token_table = {
  false => 0,
  :error => 1,
  :INTEGER => 2,
  :FLOAT => 3,
  :ADD => 4,
  :SUBTRACT => 5,
  :MULTIPLY => 6,
  :DIVIDE => 7,
  :NEWLINE => 8,
  :RPAREN => 9,
  :LPAREN => 10,
  :STRING => 11,
  :IDENTIFIER => 12,
  :ASSIGN => 13,
  :TRUE => 14,
  :FALSE => 15,
  :NIL => 16,
  :LSQBRA => 17,
  :RSQBRA => 18,
  :LCBRA => 19,
  :RCBRA => 20,
  :ROCKET => 21,
  :FN => 22,
  :COMMA => 23 }

racc_nt_base = 24

racc_use_result_var = false

Racc_arg = [
  racc_action_table,
  racc_action_check,
  racc_action_default,
  racc_action_pointer,
  racc_goto_table,
  racc_goto_check,
  racc_goto_default,
  racc_goto_pointer,
  racc_nt_base,
  racc_reduce_table,
  racc_token_table,
  racc_shift_n,
  racc_reduce_n,
  racc_use_result_var ]

Racc_token_to_s_table = [
  "$end",
  "error",
  "INTEGER",
  "FLOAT",
  "ADD",
  "SUBTRACT",
  "MULTIPLY",
  "DIVIDE",
  "NEWLINE",
  "RPAREN",
  "LPAREN",
  "STRING",
  "IDENTIFIER",
  "ASSIGN",
  "TRUE",
  "FALSE",
  "NIL",
  "LSQBRA",
  "RSQBRA",
  "LCBRA",
  "RCBRA",
  "ROCKET",
  "FN",
  "COMMA",
  "$start",
  "root",
  "program",
  "expressions",
  "number",
  "string",
  "variable_access",
  "variable_assignment",
  "expression",
  "boolean",
  "array",
  "elements",
  "hash",
  "pairs",
  "pair",
  "closure",
  "arguments",
  "binary_operation",
  "terminator" ]

Racc_debug_parser = false

##### State transition tables end #####

# reduce 0 omitted

# reduce 1 omitted

module_eval(<<'.,.,', 'lani.y', 33)
  def _reduce_2(val, _values)
     AST::Program.new( filename, lineno, [])
  end
.,.,

module_eval(<<'.,.,', 'lani.y', 34)
  def _reduce_3(val, _values)
     AST::Program.new( filename, lineno, val[0])
  end
.,.,

module_eval(<<'.,.,', 'lani.y', 36)
  def _reduce_4(val, _values)
     AST::IntegerNode.new( filename, lineno, val[0])
  end
.,.,

module_eval(<<'.,.,', 'lani.y', 37)
  def _reduce_5(val, _values)
     AST::FloatNode.new( filename, lineno, val[0])
  end
.,.,

module_eval(<<'.,.,', 'lani.y', 39)
  def _reduce_6(val, _values)
     AST::StringNode.new( filename, lineno, val[0])
  end
.,.,

module_eval(<<'.,.,', 'lani.y', 41)
  def _reduce_7(val, _values)
     AST::VariableAccessNode.new( filename, lineno, val[0])
  end
.,.,

module_eval(<<'.,.,', 'lani.y', 43)
  def _reduce_8(val, _values)
    AST::VariableAssignmentNode.new( filename, lineno, val[0], val[2]) 
  end
.,.,

module_eval(<<'.,.,', 'lani.y', 45)
  def _reduce_9(val, _values)
     AST::TrueBooleanNode.new( filename, lineno)
  end
.,.,

module_eval(<<'.,.,', 'lani.y', 46)
  def _reduce_10(val, _values)
     AST::FalseBooleanNode.new( filename, lineno)
  end
.,.,

module_eval(<<'.,.,', 'lani.y', 47)
  def _reduce_11(val, _values)
     AST::NilBooleanNode.new( filename, lineno)
  end
.,.,

module_eval(<<'.,.,', 'lani.y', 49)
  def _reduce_12(val, _values)
     AST::ArrayNode.new( filename, lineno, [])
  end
.,.,

module_eval(<<'.,.,', 'lani.y', 50)
  def _reduce_13(val, _values)
     AST::ArrayNode.new( filename, lineno, val[1]) 
  end
.,.,

module_eval(<<'.,.,', 'lani.y', 52)
  def _reduce_14(val, _values)
     [val[0]] 
  end
.,.,

module_eval(<<'.,.,', 'lani.y', 53)
  def _reduce_15(val, _values)
     val[0] << val[2] 
  end
.,.,

module_eval(<<'.,.,', 'lani.y', 55)
  def _reduce_16(val, _values)
     AST::HashNode.new(filename, lineno, []) 
  end
.,.,

module_eval(<<'.,.,', 'lani.y', 56)
  def _reduce_17(val, _values)
     AST::HashNode.new(filename, lineno, val[1]) 
  end
.,.,

# reduce 18 omitted

module_eval(<<'.,.,', 'lani.y', 59)
  def _reduce_19(val, _values)
     val[0] + val[2] 
  end
.,.,

module_eval(<<'.,.,', 'lani.y', 61)
  def _reduce_20(val, _values)
     [val[0], val[2]] 
  end
.,.,

module_eval(<<'.,.,', 'lani.y', 63)
  def _reduce_21(val, _values)
     AST::ClosureNode.new(filename, lineno, [], val[2]) 
  end
.,.,

module_eval(<<'.,.,', 'lani.y', 64)
  def _reduce_22(val, _values)
     AST::ClosureNode.new(filename, lineno, val[1], val[3]) 
  end
.,.,

module_eval(<<'.,.,', 'lani.y', 66)
  def _reduce_23(val, _values)
     [val[0].to_sym] 
  end
.,.,

module_eval(<<'.,.,', 'lani.y', 67)
  def _reduce_24(val, _values)
     val[0] << val[2].to_sym 
  end
.,.,

# reduce 25 omitted

# reduce 26 omitted

module_eval(<<'.,.,', 'lani.y', 71)
  def _reduce_27(val, _values)
     val[1] 
  end
.,.,

# reduce 28 omitted

# reduce 29 omitted

# reduce 30 omitted

# reduce 31 omitted

# reduce 32 omitted

# reduce 33 omitted

# reduce 34 omitted

module_eval(<<'.,.,', 'lani.y', 80)
  def _reduce_35(val, _values)
    AST::AddNode.new( filename, lineno, val[0], val[2])
  end
.,.,

module_eval(<<'.,.,', 'lani.y', 81)
  def _reduce_36(val, _values)
    AST::SubtractNode.new( filename, lineno, val[0], val[2])
  end
.,.,

module_eval(<<'.,.,', 'lani.y', 82)
  def _reduce_37(val, _values)
    AST::MultiplyNode.new( filename, lineno, val[0], val[2])
  end
.,.,

module_eval(<<'.,.,', 'lani.y', 83)
  def _reduce_38(val, _values)
    AST::DivideNode.new( filename, lineno, val[0], val[2])
  end
.,.,

module_eval(<<'.,.,', 'lani.y', 85)
  def _reduce_39(val, _values)
     [val[0]] 
  end
.,.,

module_eval(<<'.,.,', 'lani.y', 86)
  def _reduce_40(val, _values)
     val[0] << val[2] 
  end
.,.,

# reduce 41 omitted

def _reduce_none(val, _values)
  val[0]
end

  end   # class Parser
  end   # module Lani


