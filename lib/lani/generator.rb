module Lani
  class Generator < Rubinius::Generator
    def debug!
      p @detected_locals
      puts '*****'
      ip = 0
      while instruction = stream[ip]
        instruct = Rubinius::InstructionSet[instruction]
        ip += instruct.size
        puts "#{instruct.name}"
      end
      puts '**end**'
    end
  end
end