require 'spec_helper'

describe Lani::Parser, '#tokenize' do
  def tokenize(string)
    Lani::Parser.new.tokenize(string)
  end

  it 'tokenizes a simple add expression' do
    expect(tokenize("3 + 3")).to eq([
      [:INTEGER, 3],
      [:ADD, "+"],
      [:INTEGER, 3],
    ])
  end

  it 'tokenizes a simple subtract expression' do
    expect(tokenize("3 - 3")).to eq([
      [:INTEGER, 3],
      [:SUBTRACT, "-"],
      [:INTEGER, 3],
    ])
  end

  it 'tokenizes a simple multiply expression' do
    expect(tokenize("3 * 3")).to eq([
      [:INTEGER, 3],
      [:MULTIPLY, "*"],
      [:INTEGER, 3],
    ])
  end

  it 'tokenizes a simple divide expression' do
    expect(tokenize("3 / 3")).to eq([
      [:INTEGER, 3],
      [:DIVIDE, "/"],
      [:INTEGER, 3],
    ])
  end

  it 'tokenizes a simple binary expression with floating point numbers' do
    expect(tokenize("3.23 + 23423.3")).to eq([
      [:FLOAT, 3.23],
      [:ADD, "+"],
      [:FLOAT, 23423.3],
    ])

  end

  it 'tokenizes a complex expression' do
    expect(tokenize("3 + 3 * 5")).to eq([
      [:INTEGER, 3],
      [:ADD, "+"],
      [:INTEGER, 3],
      [:MULTIPLY, "*"],
      [:INTEGER, 5],
    ])
  end

  it 'tokenizes a complex expression with parentheses' do
    expect(tokenize("(3 + 3) * 5")).to eq([
      [:LPAREN, "("],
      [:INTEGER, 3],
      [:ADD, "+"],
      [:INTEGER, 3],
      [:RPAREN, ")"],
      [:MULTIPLY, "*"],
      [:INTEGER, 5],
    ])
  end

  it 'tokenizes a string' do
    expect(tokenize('"this is a test string 1234"')).to eq([
      [:STRING, 'this is a test string 1234'],
    ])
  end

  it 'tokenizes a string within a more complex expression' do
    expect(tokenize('1 + "this is a test string 1234" + 2')).to eq([
      [:INTEGER, 1],
      [:ADD, "+"],
      [:STRING, 'this is a test string 1234'],
      [:ADD, "+"],
      [:INTEGER, 2],
    ])
  end


  it 'tokenizes an identifier' do
    expect(tokenize('vari_able')).to eq([
      [:IDENTIFIER, "vari_able"],
    ])
  end

  it 'tokenizes a variable assignment' do
    expect(tokenize('vari_able = 1')).to eq([
      [:IDENTIFIER, "vari_able"],
      [:ASSIGN, "="],
      [:INTEGER, 1],
    ])
  end

  it 'tokenizes an array' do
    expect(tokenize('[1, 2]')).to eq([
      [:LSQBRA, '['],
      [:INTEGER, 1],
      [:COMMA, ','],
      [:INTEGER, 2],
      [:RSQBRA, ']'],
    ])
  end

  it 'tokenizes a hash' do
    expect(tokenize('{1 => 2}')).to eq([
      [:LCBRA,  '{'],
      [:INTEGER, 1],
      [:ROCKET, '=>'],
      [:INTEGER, 2],
      [:RCBRA,  '}'],
    ])
  end

  # it 'tokenizes a closure' do
  #   expect(tokenize('-> a, b {}')).to eq([
  #     [:FN, '->'],
  #     [:IDENTIFIER, "a"],
  #     [:COMMA, ','],
  #     [:IDENTIFIER, "b"],
  #     [:LCBRA, '{'],
  #     [:RCBRA, '}'],
  #   ])
  # end

  it 'tokenizes a message send' do
    expect(tokenize('2.odd?')).to eq([
      [:INTEGER, 2],
      [:DOT, "."],
      [:IDENTIFIER, "odd?"],
    ])
  end
end