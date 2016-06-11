module SortingAlgorithms
  ##
  # Implementation of Mergesort, from
  # http://rosettacode.org/wiki/Sorting_algorithms/Merge_sort#Ruby
  # Mergesort is, on average, of O(n log(n)) in time complexity
  # and of O(n) space complexity. It is notable for having its
  # worst-case analysis result as the same as its average
  # @return [Array] the sorted array
  module Mergesort
    def mergesort(&comparitor)
      return self if length <= 1
      comparitor ||= proc { |a, b| a <=> b }
      middle = length / 2
      left  = self[0...middle].mergesort(&comparitor)
      right = self[middle..-1].mergesort(&comparitor)
      merge left, right, comparitor
    end

    private

    def merge(left, right, comparitor)
      result = []
      until left.empty? || right.empty?
        result << if comparitor[left.first, right.first] <= 0
                    left.shift
                  else
                    right.shift
                  end
      end
      result + left + right
    end
  end
end
