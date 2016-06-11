require_relative '../spec_helper'
require 'benchmark/ips'

puts 'Random Data Benchmarks'
data = [*0..1_000_000].shuffle

Benchmark.ips do |x|
  x.report('quicksort') { data.quicksort }
  x.report('mergesort') { data.mergesort }
  x.report('parallel_quicksort') { data.parallel_quicksort }
  x.compare!
end
