require 'spec_helper'

describe Lani::Parser, '#scan_str' do

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

  it 'parses multiple expressions' do
    parse("3\n5") do |expressions|
      three = expressions.first
      five = expressions.last

      expect(three).to be_kind_of(AST::IntegerNode)
      expect(three.value).to eq(3)

      expect(five).to be_kind_of(AST::IntegerNode)
      expect(five.value).to eq(5)
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

  it 'parses subtraction' do
    parse("3 - 9") do |expressions|
      subtraction = expressions.first
      expect(subtraction).to be_kind_of(AST::SubtractNode)

      lhs = subtraction.lhs
      rhs = subtraction.rhs

      expect(lhs.value).to eq(3)
      expect(rhs.value).to eq(9)
    end
  end

  it 'parses multiplication' do
    parse("3 * 9") do |expressions|
      multiplication = expressions.first
      expect(multiplication).to be_kind_of(AST::MultiplyNode)

      lhs = multiplication.lhs
      rhs = multiplication.rhs

      expect(lhs.value).to eq(3)
      expect(rhs.value).to eq(9)
    end
  end

  it 'parses division' do
    parse("3 / 9") do |expressions|
      division = expressions.first
      expect(division).to be_kind_of(AST::DivideNode)

      lhs = division.lhs
      rhs = division.rhs

      expect(lhs.value).to eq(3)
      expect(rhs.value).to eq(9)
    end
  end

  it 'parses composed expressions' do
    parse("3 + 8 + 2") do |expressions|
      addition = expressions.first
      expect(addition).to be_kind_of(AST::AddNode)

      lhs = addition.lhs
      rhs = addition.rhs

      expect(rhs.value).to eq(2)
      expect(lhs).to be_kind_of(AST::AddNode)
      expect(lhs.lhs.value).to eq(3)
      expect(lhs.rhs.value).to eq(8)
    end
  end

  it 'binds multiplication before addition' do
    parse("3 * 8 + 2") do |expressions|
      addition = expressions.first
      expect(addition).to be_kind_of(AST::AddNode)

      lhs = addition.lhs
      rhs = addition.rhs

      expect(rhs.value).to eq(2)
      expect(lhs).to be_kind_of(AST::MultiplyNode)
      expect(lhs.lhs.value).to eq(3)
      expect(lhs.rhs.value).to eq(8)
    end
  end

  it 'parses parenthesized expressions' do
    parse("3 * (8 + 2)") do |expressions|
      multiplication = expressions.first
      expect(multiplication).to be_kind_of(AST::MultiplyNode)

      lhs = multiplication.lhs
      rhs = multiplication.rhs

      expect(lhs.value).to eq(3)
      expect(rhs).to be_kind_of(AST::AddNode)
      expect(rhs.lhs.value).to eq(8)
      expect(rhs.rhs.value).to eq(2)
    end
  end

  it 'parses a very complex expression' do
    parse("3 * (2 / (6 / 123 + 44444) * 34.21) - 900") do |expressions|
      subtraction = expressions.first
      expect(subtraction).to be_kind_of(AST::SubtractNode)
      expect(subtraction.rhs.value).to eq(900)
      lhs = subtraction.lhs
      expect(lhs).to be_kind_of(AST::MultiplyNode)
    end
  end
end