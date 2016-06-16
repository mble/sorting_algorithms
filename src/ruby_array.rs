extern crate libc;
use std::mem;
// Struct to marshal Rust Vecs to Ruby Arrays
#[repr(C)]
pub struct RubyArray {
    len: libc::size_t,
    data: *const libc::c_void,
}

impl RubyArray {
    pub fn from_vec<T>(vec: Vec<T>) -> RubyArray {
        let array = RubyArray {
            data: vec.as_ptr() as *const libc::c_void,
            len: vec.len() as libc::size_t,
        };
        mem::forget(vec);
        array
    }
}
