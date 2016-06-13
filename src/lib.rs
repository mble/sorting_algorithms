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
            len: vec.len() as libc::size_t,
        };
        mem::forget(vec);
        array
    }
}

type OrderFunc<T> = Fn(&T, &T) -> bool;

#[inline(always)]
fn is_less<T: Ord>(x: &T, y: &T) -> bool {
    x < y
}

#[no_mangle]
pub extern "C" fn rustmergesort(n: *const libc::int32_t, len: libc::size_t) -> RubyArray {
    let numbers = unsafe {
        assert!(!n.is_null());
        slice::from_raw_parts(n, len as usize)
    };
    let mut mutable_numbers = numbers.to_owned();
    mutable_numbers.sort(); // This is an insertion sort for a small vec
                            // but a merge sort for larger vecs
                            // https://github.com/rust-lang/rust/blob/master/src/libcollections/slice.rs#L1085

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

fn quick_sort<T>(v: &mut [T], f: &OrderFunc<T>) {
    let len = v.len();
    if len < 2 {
        return;
    }

    let pivot_index = partition(v, f);
    quick_sort(&mut v[0..pivot_index], f);
    quick_sort(&mut v[pivot_index + 1..len], f);
}

fn partition<T>(v: &mut [T], f: &OrderFunc<T>) -> usize {
    let len = v.len();
    let pivot_index = len / 2;

    v.swap(pivot_index, len - 1);

    let mut store_index = 0;
    for i in 0..len - 1 {
        if f(&v[i], &v[len - 1]) {
            v.swap(i, store_index);
            store_index += 1;
        }
    }

    v.swap(store_index, len - 1);
    store_index
}
