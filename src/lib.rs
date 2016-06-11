#![feature(libc)]
#![feature(cstr_memory)]
extern crate libc;

use std::ffi::CString;
use std::mem;

#[no_mangle]
pub extern fn sum(x: i32, y: i32) -> i32 {
    x + y
}

#[test]
fn it_works() {
    assert_eq!(sum(1, 2), 3);
}
