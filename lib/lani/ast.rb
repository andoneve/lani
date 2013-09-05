
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
      body.each do |expression|
        expression.bytecode(g)
      end
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
    end
  end

  class VariableNode < Node
    attr_reader :name

    def initialize(filename, line, name)
      super
      @name = name
    end

    def bytecode(g)
      pos(g)
      g.push_literal(name)
    end
  end

  class AssignmentNode < Node
    attr_reader :name, :value

    def initialize(filename, line, name, value)
      super
      @name = name
      @value = value
    end

    def bytecode(g)
      pos(g)
      g.push_literal(name)
      g.set_local(value)
    end
  end

  class TrueBooleanNode < Node
    attr_reader :value

    def initialize(filename, line)
      super
      @value = true
    end
  end

  class FalseBooleanNode < Node
    attr_reader :value

    def initialize(filename, line)
      super
      @value = false
    end
  end

  class NilBooleanNode < Node
    attr_reader :value

    def initialize(filename, line)
      super
      @value = nil
    end
  end


end
