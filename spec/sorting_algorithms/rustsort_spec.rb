require 'spec_helper'
module SortingAlgorithms
  describe Rustsort do
    context '#rustsort' do
      it_behaves_like 'a sorting algorithm', :rustsort
    end
  end
end
