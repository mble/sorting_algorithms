require 'spec_helper'
module SortingAlgorithms
  describe Rustsort do
    context '#sum' do
      it 'correctly adds numbers' do
        sum = Rustsort.sum(1, 2)
        expect(sum).to eq 3
      end
    end
  end
end
