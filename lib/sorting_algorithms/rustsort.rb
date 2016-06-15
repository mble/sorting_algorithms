require 'utils/rust'
module SortingAlgorithms
  ##
  # Implementation of Quicksort, but in Rust!
  # Uses FFI to cross the boundaries
  # @return [Array] the sorted array
  module Rustsort
    include Utils::Rust
    ##
    # Attach a function that hooks into the Rust library
    attach_function :rust_sort,           # Name
                    :rustsort,            # Rust function
                    [:pointer, :size_t],  # Args
                    RustArray.by_value    # Return

    ##
    # Dup the array, create a pointer containing the array data
    # then pass the pointer over to Rust to let the magic happen
    def rustsort
      arr = dup
      buf = FFI::MemoryPointer.new :int32, arr.size
      buf.write_array_of_int32(arr)
      rust_sort(buf, arr.size).to_a
    end
  end
end
