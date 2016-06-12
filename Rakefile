require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

desc 'run benchmarks'
task :run_benchmarks do
  Dir['spec/benchmarks/*.rb'].each do |benchmark|
    system 'ruby', '-v', '-W0', benchmark
  end
end

desc 'build rustsort'
task :build_lib do
  puts 'Building extension...'
  system 'cargo build --release'
end

desc 'clean up target directory'
task :clean_lib do
  puts 'Cleaning up...'
  FileUtils.rm_rf Dir.glob('target/release/*')
                     .keep_if { |f| !f[/\.(?:dylib|so|dll)\z/] }
end

desc 'build and cleanup'
task build_library: [:build_lib, :clean_lib] do
  puts 'Completed build!'
end

task default: :spec
