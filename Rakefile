require "bundler/gem_tasks"

task :clean do
  `rm lib/lani/parser/lexer.rb`
end

task :regenerate do
  has_rexical  = `gem which rexical`

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

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:test)

task :test => :regenerate
task :default => :test
