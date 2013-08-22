require 'spec_helper'

describe Lani::Parser, '#parse' do

  def parse(string)
    ast = Lani::Parser.new.scan_str(string)
    yield ast.body
  end

  it 'parses an empty script' do
    parse("") do |expressions|
      expect(expressions).to be_empty
    end
  end

  it 'parses a single integer' do
    parse("3") do |expressions|
      integer = expressions.first
      expect(integer).to be_kind_of(AST::IntegerNode)
      expect(integer.value).to eq(3)
    end
  end

  it 'parses a single floating point number' do
    parse("3.23") do |expressions|
      float = expressions.first
      expect(float).to be_kind_of(AST::FloatNode)
      expect(float.value).to eq(3.23)
    end
  end

  it 'parses addition' do
    parse("3 + 9") do |expressions|
      addition = expressions.first
      expect(addition).to be_kind_of(AST::AddNode)

      lhs = addition.lhs
      rhs = addition.rhs

      expect(lhs.value).to eq(3)
      expect(rhs.value).to eq(9)
    end
  end
end