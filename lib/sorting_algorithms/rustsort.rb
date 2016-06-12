require 'ffi'
module SortingAlgorithms
  ##
  # Implementation of Quicksort, but in Rust!
  # Uses FFI to cross the boundaries
  # @return [Array] the sorted array
  module Rustsort
    extend FFI::Library
    ffi_lib './target/release/librustsort.dylib'

    class TwoNumbers < FFI::Struct
      layout :first, :int32,
             :second, :int32
    end

    attach_function :add_one_to_vals, [TwoNumbers.by_value], TwoNumbers.by_value
    attach_function :add_struct_vals, [TwoNumbers.by_value], :int32
    attach_function :sum, [:int32, :int32], :int32
  end
end
