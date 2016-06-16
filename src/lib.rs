extern crate libc;
mod quick_sort;
mod ruby_array;

use std::slice;
use quick_sort::quick_sort;
use ruby_array::RubyArray;

#[no_mangle]
pub extern "C" fn rustmergesort(n: *const libc::int32_t, len: libc::size_t) -> RubyArray {
    let numbers = unsafe {
        assert!(!n.is_null());
        slice::from_raw_parts(n, len as usize)
    };
    let mut mutable_numbers = numbers.to_owned();
    // This is an insertion sort for a small vec
    // but a merge sort for larger vecs
    // https://github.com/rust-lang/rust/blob/master/src/libcollections/slice.rs#L1085
    mutable_numbers.sort();
    RubyArray::from_vec(mutable_numbers)
}

#[no_mangle]
pub extern "C" fn rustsort(n: *const libc::int32_t, len: libc::size_t) -> RubyArray {
    let numbers = unsafe {
        assert!(!n.is_null());
        slice::from_raw_parts(n, len as usize)
    };
    let mut mutable_numbers = numbers.to_owned();
    quick_sort(&mut mutable_numbers, &is_less);

    RubyArray::from_vec(mutable_numbers)
}

fn is_less<T: Ord>(x: &T, y: &T) -> bool {
    x < y
}
