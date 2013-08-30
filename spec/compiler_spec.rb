require 'spec_helper'

describe Lani::Compiler do
  it 'compiles integers' do
    Lani::Compiler.eval("3").must_equal 3
  end
end