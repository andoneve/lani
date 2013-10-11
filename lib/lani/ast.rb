
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
    end
  end

  class IntegerNode < Node
    attr_reader :value

    def initialize(filename, line, value)
      super
      @value = value.to_i
    end

    def bytecode(g)
    end
  end

  class FloatNode < Node
    attr_reader :value

    def initialize(filename, line, value)
      super
      @value = value.to_f
    end

    def bytecode(g)
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
    end
  end

  class SubtractNode < BinaryNode

    def bytecode(g)
    end
  end

  class MultiplyNode < BinaryNode
    def bytecode(g)
    end
  end

  class DivideNode < BinaryNode
    def bytecode(g)
    end
  end

  class StringNode < Node
    attr_reader :value

    def initialize(filename, line, value)
      super
      @value = value
    end

    def bytecode(g)
    end
  end

  class VariableAccessNode < Node
    attr_reader :name

    def initialize(filename, line, name)
      super
      @name = name
    end

    def bytecode(g)
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
    end
  end

  class TrueBooleanNode < Node
    attr_reader :value

    def initialize(filename, line)
      super
      @value = true
    end

    def bytecode(g)
    end
  end

  class FalseBooleanNode < Node
    attr_reader :value

    def initialize(filename, line)
      super
      @value = false
    end

    def bytecode(g)
    end
  end

  class NilBooleanNode < Node
    attr_reader :value

    def initialize(filename, line)
      super
      @value = nil
    end

    def bytecode(g)
    end
  end

  class ArrayNode < Node
    attr_reader :value

    def initialize(filename, line, value)
      super
      @value = value
    end

    def bytecode(g)
    end
  end

  class HashNode < Node
    attr_reader :array

    def initialize(filename, line, array)
      super
      @array = array
    end

    def bytecode(g)
    end
  end
end
