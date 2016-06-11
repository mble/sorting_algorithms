require 'sorting_algorithms/quicksort'
require 'sorting_algorithms/mergesort'
require 'sorting_algorithms/parallel_quicksort'
require 'sorting_algorithms/rustsort'
##
# Activate Array patches
class Array
  include SortingAlgorithms::Quicksort
  include SortingAlgorithms::Mergesort
  include SortingAlgorithms::ParallelQuicksort
end
