require 'spec_helper'
module SortingAlgorithms
  describe Rustsort do
    context '#sum' do
      it 'correctly adds numbers' do
        sum = Rustsort.sum(1, 2)
        expect(sum).to eq 3
      end
    end

    context '#add_struct_vals' do
      it 'correctly adds values' do
        tn = Rustsort::TwoNumbers.new
        tn[:first] = 10
        tn[:second] = 20
        expect(Rustsort.add_struct_vals(tn)).to eq 30
      end
    end

    context 'add_one_to_vals' do
      it 'correctly adds one to values' do
        tn = Rustsort::TwoNumbers.new
        tn[:first] = 10
        tn[:second] = 20
        tn2 = Rustsort.add_one_to_vals(tn)
        expect(tn2[:first]).to eq 11
        expect(tn2[:second]).to eq 21
      end
    end
  end
end
