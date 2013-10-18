require 'spec_helper'

describe Lani::Compiler do
  it 'compiles integers' do
    Lani::Compiler.eval("3").should eq(3)
  end

  it 'compiles large integers' do
  	Lani::Compiler.eval("256").should eq(256)
  end

  it 'compiles floats' do
  	Lani::Compiler.eval("1.5").should eq(1.5)
  end

  it 'compiles addition' do
  	Lani::Compiler.eval("2+3").should eq(5)
  end

  it 'compiles subtraction' do
  	Lani::Compiler.eval("3-2").should eq(1)
  end

  it 'compiles multiplication' do
  	Lani::Compiler.eval("3*2").should eq(6)
  end

  it 'compiles division' do
  	Lani::Compiler.eval("3/2.0").should eq(1.5)
  end

  it 'compiles a complex operation' do
  	Lani::Compiler.eval("3 * (2 / (6 / 123 + 44444) * 34.21) - 900").should eq(-900.0)
  end

  it 'compiles a string' do
    Lani::Compiler.eval('"this is a test string 1234"').should eq('this is a test string 1234')
  end

  it 'makes a duplicate of the string literal' do
    result = Lani::Compiler.eval('["foo", "foo"]')
    result.first.gsub!("f", "b")
    result.last.should eq("foo")
  end

  it 'compiles a true boolean' do
    Lani::Compiler.eval("true").should eq(true)
  end

  it 'compiles a false boolean' do
    Lani::Compiler.eval("false").should eq(false)
  end

  it 'compiles a nil boolean' do
    Lani::Compiler.eval("nil").should eq(nil)
  end

  it 'compiles a variable assignment and access' do
    Lani::Compiler.eval("a = 1\na").should eq(1)
  end

  it 'compiles an array' do
    Lani::Compiler.eval("[1, 2 + 4, \"foo\", [3]]").should eq([1, 6, "foo", [3]])
  end

  it 'compiles a hash' do
    Lani::Compiler.eval("{1 => 12, \"foo\" => 98}").should eq({1 => 12, "foo" => 98})
  end

  it 'compiles a closure' do
    fn = Lani::Compiler.eval("x = 3\n-> a, b { x * b }")
    fn.call(:foo, 2).should eq(6)
  end

  it 'compiles a message send without arguments' do
    Lani::Compiler.eval("3.odd?").should eq(true)
  end

  it 'compiles a message send with arguments' do
    Lani::Compiler.eval(%q{"foo".gsub("f","h")}).should eq("hoo")
  end
end
