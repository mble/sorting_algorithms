require 'spec_helper'
module SortingAlgorithms
  describe RustMergesort do
    context '#rustmergesort' do
      it_behaves_like 'a sorting algorithm', :rustmergesort
    end
  end
end
