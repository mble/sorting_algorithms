require_relative '../spec_helper'
require 'benchmark/ips'

puts 'Random Data Benchmarks'
data = [*0..1_000_000].shuffle

Benchmark.ips do |x|
  x.report('Array#sort') { data.sort }
  x.report('Array#quicksort') { data.quicksort }
  x.report('Array#mergesort') { data.mergesort }
  x.report('Array#rustsort') { data.rustsort }
  x.report('Array#rustmergesort') { data.rustmergesort }
  x.compare!
end
