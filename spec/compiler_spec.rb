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
end

