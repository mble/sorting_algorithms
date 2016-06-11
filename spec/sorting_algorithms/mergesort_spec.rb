require 'spec_helper'
module SortingAlgorithms
  describe Mergesort do
    context '#mergesort' do
      it 'correctly sorts the array' do
        arr = []
        rand(5..30).times { arr << rand(1000) }
        expect(arr.mergesort).to eq arr.sort
      end
    end
  end
end
