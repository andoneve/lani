
module AST
  class Program
    attr_reader :filename, :line, :body

    def initialize(filename="(script)", line=1, body=[])
      @filename = filename
      @line = line
      @body = body
    end
  end

  class IntegerNode
    attr_reader :filename, :line, :value

    def initialize(filename="(script)", line=1, value)
      @filename = filename
      @line = line
      @value = value
    end
  end

  class FloatNode
    attr_reader :filename, :line, :value

    def initialize(filename="(script)", line=1, value)
      @filename = filename
      @line = line  
      @value = value
    end
  end

  class AddNode
    attr_reader :filename, :line, :lhs, :rhs

    def initialize(filename="(script)", line=1, lhs, rhs)
      @filename = filename
      @line = line
      @lhs = lhs
      @rhs = rhs
    end
  end

  class SubtractNode
    attr_reader :filename, :line, :lhs, :rhs

    def initialize(filename="(script)", line=1, lhs, rhs)
      @filename = filename
      @line = line
      @lhs = lhs
      @rhs = rhs
    end
  end

   class MultiplyNode
    attr_reader :filename, :line, :lhs, :rhs

    def initialize(filename="(script)", line=1, lhs, rhs)
      @filename = filename
      @line = line
      @lhs = lhs
      @rhs = rhs
    end
  end

  class DivideNode
    attr_reader :filename, :line, :lhs, :rhs

    def initialize(filename="(script)", line=1, lhs, rhs)
      @filename = filename
      @line = line
      @lhs = lhs
      @rhs = rhs
    end
  end
end
