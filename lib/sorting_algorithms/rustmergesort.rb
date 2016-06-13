require 'ffi'
module SortingAlgorithms
  ##
  # Implementation of Mergesort, but in Rust!
  # Uses FFI to cross the boundaries
  # @return [Array] the sorted array
  module RustMergesort
    extend FFI::Library
    ffi_lib begin
      pre = Gem.win_platform? ? '' : 'lib'
      suffix = FFI::Platform::LIBSUFFIX
      dirname = File.dirname(__FILE__)
      target = '../../target/release/'
      "#{File.expand_path(target, dirname)}/#{pre}rustsort.#{suffix}"
    end

    ##
    # Struct to handle marshalling data from Rust
    class RustArray < FFI::Struct
      layout :len,  :size_t,
             :data, :pointer

      def to_a
        self[:data].get_array_of_int(0, self[:len]).compact
      end
    end

    ##
    # Attach a function that hooks into the Rust library
    attach_function :rust_mergesort, # Name
                    :rustmergesort, # Rust function
                    [:pointer, :size_t], # Args
                    RustArray.by_value # Return

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
