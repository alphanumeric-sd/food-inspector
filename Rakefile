require 'rspec/core/rake_task'
require 'rubocop/rake_task'

RSpec::Core::RakeTask.new(:spec)

task default: :spec

desc 'Run rubocop'
task :rubocop do
  RuboCop::RakeTask.new
end

desc 'Check rubocop and all tests'
task test: [:rubocop, :spec]
