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

end

