require 'ffi'
##
# Utility module
module Utils
  ##
  # Contains a link to the Rust library and
  # a struct to aid in marshalling data across
  module Rust
    ##
    # Give Rust library access to modules/classes
    # this module is included in
    def self.included(base)
      base.extend FFI::Library
      base.ffi_lib begin
        pre = Gem.win_platform? ? '' : 'lib'
        suffix = FFI::Platform::LIBSUFFIX
        dirname = File.dirname(__FILE__)
        target = '../../target/release/'
        "#{File.expand_path(target, dirname)}/#{pre}rustsort.#{suffix}"
      end
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
  end
end
