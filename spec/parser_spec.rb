require 'spec_helper'

module Lani
  describe Parser, '#scan_str' do

    def parse(string)
      ast = Parser.new.scan_str(string)
      yield ast.body
    end

    it 'parses an empty program' do
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

    it 'parses a string' do
      parse('"this is a test string 1234"') do |expressions|
        string = expressions.first
        expect(string).to be_kind_of(AST::StringNode)
        expect(string.value).to eq('this is a test string 1234')
      end
    end

    it 'parses a variable access' do
      parse('a') do |expressions|
        assignment = expressions.first
        expect(assignment).to be_kind_of(AST::VariableAccessNode)
        expect(assignment.name).to eq('a')
      end
    end

    it 'parses a variable assignment' do
      parse('a = 1') do |expressions|
        assignment = expressions.first
        expect(assignment).to be_kind_of(AST::VariableAssignmentNode)
        expect(assignment.name).to eq('a')
        expect(assignment.value.value).to eq(1)
      end
    end

    it 'parses an empty array' do
      parse('[]') do |expressions|
        array = expressions.first
        expect(array).to be_kind_of(AST::ArrayNode)
        expect(array.value).to eq([])
      end
    end

    it 'parses an array with one element' do
      parse('[1]') do |expressions|
        array = expressions.first
        expect(array).to be_kind_of(AST::ArrayNode)
        expect(array.value.length).to eq(1)
        element = array.value.first
        expect(element).to be_kind_of(AST::IntegerNode)
        expect(element.value).to eq(1)
      end
    end

    it 'parses an array with multiple elements' do
      parse('[1, 2, 3]') do |expressions|
        array = expressions.first
        expect(array).to be_kind_of(AST::ArrayNode)
        first, second, third = array.value

        expect(first).to be_kind_of(AST::IntegerNode)
        expect(first.value).to eq(1)
        expect(second).to be_kind_of(AST::IntegerNode)
        expect(second.value).to eq(2)
        expect(third).to be_kind_of(AST::IntegerNode)
        expect(third.value).to eq(3)
      end
    end

    it 'parses an empty hash' do
      parse('{}') do |expressions|
        hash = expressions.first
        expect(hash).to be_kind_of(AST::HashNode)
        expect(hash.array.length).to eq(0)
      end
    end

    it 'parses a map with one key and one value' do
      parse('{3 => 4}') do |expressions|
        hash = expressions.first
        expect(hash).to be_kind_of(AST::HashNode)
        expect(hash.array.length).to eq(2)
        expect(hash.array.first.value).to eq(3)
        expect(hash.array.last.value).to eq(4)
      end
    end

    it 'parses a map with multiple keys and values' do
      parse('{3 => 4, "foo" => 234}') do |expressions|
        hash = expressions.first
        expect(hash).to be_kind_of(AST::HashNode)
        expect(hash.array.length).to eq(4)
        expect(hash.array[0].value).to eq(3)
        expect(hash.array[1].value).to eq(4)
        expect(hash.array[2].value).to eq("foo")
        expect(hash.array[3].value).to eq(234)
      end
    end

    # it 'parses a closure' do
    #   parse('-> a, b { 3 }') do |expressions|
    #     closure = expressions.first
    #     expect(closure).to be_kind_of(AST::ClosureNode)
    #     expect(closure.arguments).to eq([:a, :b])
    #     expect(closure.body.first.value).to eq(3)
    #   end
    # end

    it 'parses a message send' do
      parse('2.odd?') do |expressions|
        msg = expressions.first
        expect(msg).to be_kind_of(AST::MessageSend)
        expect(msg.name).to eq(:odd?)
        expect(msg.receiver.value).to eq(2)
      end
    end
  end
end