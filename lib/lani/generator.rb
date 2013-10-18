module Lani
  class Generator < RBX::Generator
    def debug!
      p @detected_locals
      puts '*****'
      ip = 0
      while instruction = stream[ip]
        instruct = RBX::InstructionSet[instruction]
        ip += instruct.size
        puts "#{instruct.name}"
      end
      puts '**end**'
    end
  end
end