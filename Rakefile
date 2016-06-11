require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

desc 'run benchmarks'
task :run_benchmarks do
  Dir['spec/benchmarks/*.rb'].each do |benchmark|
    system 'ruby', '-v', '-W0', benchmark
  end
end

task default: :spec
