
module AST
  class Node
    attr_reader :filename, :line

    def initialize(filename="(script)", line=1, *args)
      @filename = filename
      @line = line
    end
  end

  class Program < Node
    attr_reader :body

    def initialize(*args, body)
      super
      @body = body
    end
  end

  class IntegerNode < Node
    attr_reader :value

    def initialize(*args, value)
      super
      @value = value.to_i
    end
  end

  class FloatNode < Node
    attr_reader :value

    def initialize(*args, value)
      super
      @value = value.to_f
    end
  end

  class BinaryNode < Node
    attr_reader :lhs, :rhs

    def initialize(*args, lhs, rhs)
      super
      @lhs = lhs
      @rhs = rhs
    end
  end

  class AddNode < BinaryNode
  end

  class SubtractNode < BinaryNode
  end

  class MultiplyNode < BinaryNode
  end

  class DivideNode < BinaryNode
  end
end
