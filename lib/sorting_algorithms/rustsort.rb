require 'ffi'
module SortingAlgorithms
  ##
  # Implementation of Quicksort, but in Rust!
  # Uses FFI to cross the boundaries
  # @return [Array] the sorted array
  module Rustsort
    extend FFI::Library
    ffi_lib './target/release/librustsort.dylib'
    class RustArray < FFI::Struct
      layout :len,  :size_t,
             :data, :pointer

      def to_a
        self[:data].get_array_of_int(0, self[:len]).compact
      end
    end

    attach_function :array_pass, [:pointer, :size_t], RustArray.by_value
    attach_function :rustsort, [:pointer, :size_t], RustArray.by_value

    def rust_sort
      arr = dup
      buf = FFI::MemoryPointer.new :int32, arr.size
      buf.write_array_of_int32(arr)
      rustsort(buf, arr.size).to_a
    end

    def array_pass_test
      arr = dup
      buf = FFI::MemoryPointer.new :int32, arr.size
      buf.write_array_of_int32(arr)
      array_pass(buf, arr.size)
    end

   # def rustsort
   #   arr = dup
   #   size = arr.size
   #   offset = 0
   #   pointer = FFI::MemoryPointer.new :int32, size
   #   pointer.put_array_of_int32 offset, arr
   #   sort_in_rust(pointer).to_a
   # end
  end
end
