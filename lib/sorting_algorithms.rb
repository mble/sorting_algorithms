require 'sorting_algorithms/quicksort'
require 'sorting_algorithms/mergesort'
require 'sorting_algorithms/parallel_quicksort'
##
# Activate Array patches
class Array
  include SortingAlgorithms::Quicksort
  include SortingAlgorithms::Mergesort
  include SortingAlgorithms::ParallelQuicksort
end
