require_relative '../spec_helper'
require 'benchmark/ips'

data = [*0..1_000_000].shuffle

Benchmark.ips do |x|
  x.report('quicksort') { data.quicksort }
  x.report('sort') { data.sort }
  x.compare!
end
