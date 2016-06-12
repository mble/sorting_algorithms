require 'spec_helper'
module SortingAlgorithms
  describe Rustsort do
    context '#rustsort' do
      it 'correctly sorts the array' do
        arr = []
        rand(5..30).times { arr << rand(1000) }
        expect(arr.rustsort).to eq arr.sort
      end
    end
  end
end
