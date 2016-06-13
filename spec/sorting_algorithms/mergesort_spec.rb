require 'sorting_algorithms/shared'

module SortingAlgorithms
  describe Mergesort do
    context '#mergesort' do
      it_behaves_like 'a sorting algorithm', :mergesort
    end
  end
end
