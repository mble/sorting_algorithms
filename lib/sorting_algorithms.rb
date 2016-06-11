require 'sorting_algorithms/quicksort'
require 'sorting_algorithms/mergesort'
##
# Activate Array patches
class Array
  include SortingAlgorithms::Quicksort
  include SortingAlgorithms::Mergesort
end
