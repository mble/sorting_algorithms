require 'sorting_algorithms/shared'

module SortingAlgorithms
  describe Quicksort do
    context '#quicksort' do
      it_behaves_like 'a sorting algorithm', :quicksort
    end
  end
end
