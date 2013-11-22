class RBX::Scope
  include RBX::Compiler::LocalVariables

  attr_accessor :parent

  def nest_scope(scope)
    scope.parent = self
  end

  def search_local(name)
    if variable = variables[name]
      variable.nested_reference
    elsif reference = @parent.search_local(name)
      reference.depth += 1
      reference
    end
  end

  def new_local(name)
    variables[name] ||= RBX::Compiler::LocalVariable.new allocate_slot
  end

  def new_nested_local(name)
    new_local(name).nested_reference
  end

  def assign_local_reference(var)
    if variable = variables[var.name]
      var.variable = variable.reference
    elsif reference = @parent.search_local(var.name)
      reference.depth += 1
      var.variable = reference
    else
      variable = new_local var.name
      var.variable = variable.reference
    end
  end
end

class RBX::BlockCompiler
  def initialize(arguments, body)
    @arguments = arguments
    @body = body
  end

  def compile_arguments(g)
    g.required_args = required_args
    g.post_args = post_args
    g.total_args = total_args
    g.cast_for_multi_block_arg unless arguments.count.zero?

    arguments.each_with_index do |a, i|
      g.shift_array
      local = g.state.scope.new_local(a.to_s)
      g.set_local local.slot
      g.pop
    end
    g.pop unless arguments.empty?
  end

  def compile_body(g)
    g.state.push_block

    body.each_with_index do |expression, idx|
      expression.bytecode(g)
      g.pop unless idx == body.size - 1
    end

    g.state.pop_block
    g.ret
  end

  def finalize(g)
    g.local_names = g.state.scope.local_names
    g.local_count = g.state.scope.local_count
    g.pop_state
    g.close
  end

  private
  attr_reader :arguments, :body

  def required_args
    arguments.count
  end

  def post_args
    arguments.count
  end

  def total_args
    arguments.count
  end
end

class RBX::Generator
  def self.for_block(g, scope)
    blk_g = g.class.new
    blk_g.name = g.state.name || :__block__
    blk_g.file = g.file
    blk_g.for_block = true

    g.state.scope.nest_scope scope
    blk_g.push_state scope

    blk_g.state.push_super g.state.super
    blk_g.state.push_eval g.state.eval
    blk_g.state.push_name blk_g.name

    blk_g
  end
end

