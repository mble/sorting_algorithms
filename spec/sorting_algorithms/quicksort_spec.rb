require 'spec_helper'
module SortingAlgorithms
  describe Quicksort do
    context '#quicksort' do
      it 'correctly sorts the array' do
        arr = []
        rand(5..30).times { arr << rand(1000) }
        expect(arr.quicksort).to eq arr.sort
      end
    end
  end
end
