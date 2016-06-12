require_relative '../spec_helper'
require 'benchmark/ips'

puts 'Sorted Data Benchmarks'
data = [*0..1_000_000]

Benchmark.ips do |x|
  x.report('Array#sort') { data.sort }
  x.report('Array#mergesort') { data.mergesort }
  x.report('Array#quicksort') { data.quicksort }
  x.report('Array#parallel_quicksort') { data.parallel_quicksort }
  x.report('Array#rustsort') { data.rustsort }
  x.compare!
end
