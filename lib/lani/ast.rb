
module AST
  class Node
    attr_reader :filename, :line

    def initialize(filename="(script)", line=1, *args)
      @filename = filename
      @line = line
    end

    def pos(g)
      g.set_line line
    end
  end

  class Program < Node
    attr_reader :body

    def initialize(filename, line, body)
      super
      @body = body
    end

    def bytecode(g)
      g.file = (filename || :"(lani)").to_sym
      pos(g)

      body.each_with_index do |expression, idx|
        expression.bytecode(g)
        g.pop unless idx == body.size - 1
      end

      g.finalize
    end
  end

  class IntegerNode < Node
    attr_reader :value

    def initialize(filename, line, value)
      super
      @value = value.to_i
    end

    def bytecode(g)
      pos(g)
      g.push value
    end
  end

  class FloatNode < Node
    attr_reader :value

    def initialize(filename, line, value)
      super
      @value = value.to_f
    end

    def bytecode(g)
      pos(g)
      g.push_literal(value)
    end
  end

  class BinaryNode < Node
    attr_reader :lhs, :rhs

    def initialize(filename, line, lhs, rhs)
      super
      @lhs = lhs
      @rhs = rhs
    end
  end

  class AddNode < BinaryNode

    def bytecode(g)
      pos(g)
      lhs.bytecode(g)
      rhs.bytecode(g)
      g.send(:+, 1)
    end
  end

  class SubtractNode < BinaryNode

    def bytecode(g)
      pos(g)
      lhs.bytecode(g)
      rhs.bytecode(g)
      g.send(:-, 1)
    end
  end

  class MultiplyNode < BinaryNode
    def bytecode(g)
      pos(g)
      lhs.bytecode(g)
      rhs.bytecode(g)
      g.send(:*, 1)
    end
  end

  class DivideNode < BinaryNode
    def bytecode(g)
      pos(g)
      lhs.bytecode(g)
      rhs.bytecode(g)
      g.send(:/, 1)
    end
  end

  class StringNode < Node
    attr_reader :value

    def initialize(filename, line, value)
      super
      @value = value
    end

    def bytecode(g)
      pos(g)
      g.push_literal(value)
      g.string_dup
    end
  end

  class VariableAccessNode < Node
    attr_reader :name

    def initialize(filename, line, name)
      super
      @name = name
    end

    def bytecode(g)
      pos(g)
      local = g.state.scope.search_local(name)
      local.get_bytecode(g)
    end
  end

  class VariableAssignmentNode < Node
    attr_reader :name, :value

    def initialize(filename, line, name, value)
      super
      @name = name
      @value = value
    end

    def bytecode(g)
      pos(g)
      value.bytecode(g)
      local = g.state.scope.new_local(name)
      local.reference.set_bytecode(g)
    end

  end

  class TrueBooleanNode < Node
    attr_reader :value

    def initialize(filename, line)
      super
      @value = true
    end

    def bytecode(g)
      pos(g)
      g.push_true
    end
  end

  class FalseBooleanNode < Node
    attr_reader :value

    def initialize(filename, line)
      super
      @value = false
    end

    def bytecode(g)
      pos(g)
      g.push_false
    end
  end

  class NilBooleanNode < Node
    attr_reader :value

    def initialize(filename, line)
      super
      @value = nil
    end

    def bytecode(g)
      pos(g)
      g.push_nil
    end
  end

  class ArrayNode < Node
    attr_reader :value

    def initialize(filename, line, value)
      super
      @value = value
    end

    def bytecode(g)
      pos(g)
      value.each do |element|
        element.bytecode(g)
      end
      g.make_array value.length
    end
  end

  class ArrayNode < Node
    attr_reader :value

    def initialize(filename, line, value)
      super
      @value = value
    end

    def bytecode(g)
      pos(g)
      value.each do |element|
        element.bytecode(g)
      end
      g.make_array value.length
    end
  end

  class HashNode < Node
    attr_reader :array

    def initialize(filename, line, array)
      super
      @array = array
    end

    def bytecode(g)
      pos(g)

      g.push_cpath_top
      g.find_const :Hash
      g.send :allocate, 0

      array.each_slice(2) do |k, v|
        g.dup

        k.bytecode(g)
        v.bytecode(g)
        g.send :[]=, 2

        g.pop
      end
    end
  end

  class ClosureNode < Node
    attr_reader :arguments, :body, :scope

    def initialize(filename, lineno, arguments, body)
      super
      @scope = RBX::AST::Iter.new(
        filename,
        lineno,
        AST::Program.new(filename, lineno, [])
      )
      @arguments = arguments
      @body = body
    end

    def bytecode(g)
      pos(g)

      state = g.state
      state.scope.nest_scope scope

      fn_g = new_fn_generator(g)
      pos(fn_g)

      fn_g.push_state scope

      fn_g.state.push_super state.super
      fn_g.state.push_eval state.eval
      fn_g.state.push_name fn_g.name

      compile_arguments(fn_g)
      fn_g.state.push_block

      body.each_with_index do |expression, idx|
        expression.bytecode(fn_g)
        fn_g.pop unless idx == body.size - 1
      end

      fn_g.state.pop_block
      fn_g.ret
      fn_g.finalize

      g.create_block fn_g
    end

    private

    def compile_arguments(g)
      arguments.each_with_index do |a, i|
        g.shift_array
        local = g.state.scope.new_local(a.to_s)
        g.set_local local.slot
        g.pop
      end
      g.pop unless arguments.empty?
    end

    def new_fn_generator(g)
      blk = g.class.new
      blk.name = g.state.name || :__fn__
      blk.file = g.file
      blk.for_block = true

      blk.required_args = arguments.count
      blk.post_args = arguments.count
      blk.total_args = arguments.count
      blk.cast_for_multi_block_arg unless arguments.count.zero?

      blk
    end
  end
end
