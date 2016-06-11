require 'ffi'
module SortingAlgorithms
  ##
  # Implementation of Quicksort, but in Rust!
  # Uses FFI to cross the boundaries
  # @return [Array] the sorted array
  module Rustsort
    extend FFI::Library
    ffi_lib './target/release/librustsort.dylib'

    attach_function :sum, [:int32, :int32], :int32
  end
end
