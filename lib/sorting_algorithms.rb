require 'sorting_algorithms/quicksort'
require 'sorting_algorithms/mergesort'
require 'sorting_algorithms/rustsort'
require 'sorting_algorithms/rustmergesort'
##
# Activate Array patches
class Array
  include SortingAlgorithms::Quicksort
  include SortingAlgorithms::Mergesort
  include SortingAlgorithms::Rustsort
  include SortingAlgorithms::RustMergesort
end
