require_relative '../spec_helper'
require 'benchmark/ips'

puts 'Sorted Data Benchmarks'
data = [*0..1_000_000]

Benchmark.ips do |x|
  x.report('mergesort') { data.mergesort }
  x.report('quicksort') { data.quicksort }
  x.compare!
end
