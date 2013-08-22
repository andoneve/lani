require "bundler/gem_tasks"

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:test)

namespace :rexical do
  desc "clean the generated lexer"
  task :clean do
    `rm lib/lani/parser/lexer.rb`
  end

  desc "Regenerate the lexer grammar"
  task :regenerate do
    has_rexical  = `which rexical`

    if has_rexical
      `rex lib/lani/parser/lani.rex -o lib/lani/parser/lexer.rb`
    else
      puts "You need Rexical. Install it by doing:"
      puts
      puts "\t\tgem install rexical"
      puts
      puts "Or just type `bundle install`."
    end
  end

end

namespace :racc do
  desc "It regenerates the parser.rb file"
  task :clean do
    `rm lib/lani/parser/parser.rb`
  end

  desc "Regenerate the parser grammar"
  task :regenerate do
    has_racc  = `which racc`

    if has_racc
      `racc lib/lani/parser/lani.y -o lib/lani/parser/parser.rb`
    else
      puts "You need Racc. Install it by doing:"
      puts
      puts "\t\tgem install racc"
      puts
      puts "Or just type `bundle install`."
    end
  end

end

task :test => ["rexical:regenerate", "racc:regenerate"]
task :default => :test
