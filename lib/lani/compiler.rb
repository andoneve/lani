require_relative 'parser'
require_relative 'generator'

module Lani
  class Compiler < Rubinius::Compiler
    Stages = Hash.new { |h,k| Rubinius::Compiler::Stages[k] }

    def initialize(from, to)
      @start = Stages[from].new self, to
    end

    def self.eval(code, *args)
      file, line, binding, instance = '(eval)', 1, Object.send(:binding), Object.new
      args.each do |arg|
        case arg
        when String   then file    = arg
        when Integer  then line    = arg
        when Binding  then binding = arg
        else
          instance = arg
        end
      end

      cm       = compile_eval(code, binding.variables, file, line)
      cm.scope = Rubinius::ConstantScope.new(Object)
      cm.name  = :__lani__
      script   = Rubinius::CompiledMethod::Script.new(cm, file, true)
      be       = Rubinius::BlockEnvironment.new

      script.eval_source  = code
      cm.scope.script     = script

      be.under_context(binding.variables, cm)
      be.call_on_instance(instance)
    end

    class Generator < Rubinius::Compiler::Generator
      Stages[:bytecode] = self
      next_stage Rubinius::Compiler::Encoder

      def initialize(*)
        super
      ensure
        @processor = Lani::Generator
      end
    end

    class Parser < Rubinius::Compiler::Parser
      def initialize(*)
        super
      ensure
        @processor = Lani::Parser
      end

      def create
        @parser = @processor.new
      end
    end

    class FileParser < Parser
      Stages[:file] = self
      next_stage Generator

      def input(file, line=1)
        @file = file
        @line = line
      end

      def parse
        create.parse_file
      end
    end

    # source string -> AST
    class StringParser < Parser
      Stages[:string] = self
      next_stage Generator

      def input(string, name="(eval)", line=1)
        @input = string
        @file = name
        @line = line
      end

      def parse
        create.parse_string(@input)
      end
    end

    class EvalParser < StringParser
      Stages[:eval] = self
      next_stage Generator

      def should_cache?
        @output.should_cache?
      end
    end
  end
end