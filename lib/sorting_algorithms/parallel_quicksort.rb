module SortingAlgorithms
  ##
  # Quick and dirty implementation of a parallelised version
  # of Quicksort. Not much, if any, improvement. Just for fun.
  # @return [Array] the sorted array
  module ParallelQuicksort
    MUTEX = Mutex.new
    def parallel_quicksort
      return self if length <= 1
      pivot = sample
      partition = group_by { |n| n <=> pivot }
      partition.default = []
      left = []
      right = []
      left_thread = Thread.new { left = partition[-1].quicksort }
      right_thread = Thread.new { right = partition[1].quicksort }
      MUTEX.synchronize do
        [left_thread, right_thread].map(&:join)
        left + [pivot] + right
      end
    end
  end
end
