module SortingAlgorithms
  ##
  # Implementation of Quicksort, using a random pivot
  # Quicksort is, on average, of O(n log(n)) in time complexity
  # and of O(log(n)) space complexity
  # @return [Array] the sorted array
  module Quicksort
    def quicksort
      return self if length <= 1
      pivot = sample
      partition = group_by { |n| n <=> pivot }
      partition.default = []
      partition[-1].quicksort + partition[0] + partition[1].quicksort
    end
  end
end
