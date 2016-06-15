require 'utils/rust'
module SortingAlgorithms
  ##
  # Implementation of Mergesort, but in Rust!
  # Uses FFI to cross the boundaries
  # @return [Array] the sorted array
  module RustMergesort
    include Utils::Rust
    ##
    # Attach a function that hooks into the Rust library
    attach_function :rust_mergesort,      # Name
                    :rustmergesort,       # Rust function
                    [:pointer, :size_t],  # Args
                    RustArray.by_value    # Return

    ##
    # Dup the array, create a pointer containing the array data
    # then pass the pointer over to Rust to let the magic happen
    def rustmergesort
      arr = dup
      buf = FFI::MemoryPointer.new :int32, arr.size
      buf.write_array_of_int32(arr)
      rust_mergesort(buf, arr.size).to_a
    end
  end
end
