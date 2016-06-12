#![feature(libc)]
extern crate libc;
use std::mem;
use std::slice;

#[repr(C)]
pub struct RubyArray {
    len: libc::size_t,
    data: *const libc::c_void,
}

impl RubyArray {
    fn from_vec<T>(vec: Vec<T>) -> RubyArray {
        let array = RubyArray {
            data: vec.as_ptr() as *const libc::c_void,
            len: vec.len() as libc::size_t };
        mem::forget(vec);
        array
    }

    fn from_slice<T>(slice: &[T], len: libc::size_t) -> RubyArray {
        let array = RubyArray {
            data: slice.as_ptr() as *const libc::c_void,
            len: len as libc::size_t };
        mem::forget(slice);
        mem::forget(len);
        array
    }
}

#[no_mangle]
pub extern fn array_pass(n: *const libc::int32_t, len: libc::size_t) -> RubyArray {
    let mut nums: Vec<&i32> = vec![];
    let numbers = unsafe {
        assert!(!n.is_null());
        slice::from_raw_parts(n, len as usize)
    };
    for i in numbers {
        nums.push(i);
    }
    println!("{:?}", nums);
    RubyArray::from_slice(numbers, len)
}

#[no_mangle]
pub extern fn number_to_int_array() -> RubyArray {
    let mut nums: Vec<i32> = vec![];

    for i in 33..136 {
        nums.push(i);
    }
    RubyArray::from_vec(nums)
}

#[no_mangle]
pub extern fn sum(x: i32, y: i32) -> i32 {
    x + y
}

#[test]
fn it_works() {
    assert_eq!(sum(1, 2), 3);
}
