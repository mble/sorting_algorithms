#![feature(libc)]
#![feature(cstr_memory)]
extern crate libc;

use std::ffi::CString;
use std::mem;

pub struct TwoNumbers {
    first: i32,
    second: i32,
}

impl TwoNumbers {
    fn plus_one_to_each(self) -> TwoNumbers {
        let mut tn = self;
        tn.first += 1;
        tn.second += 1;
        tn
    }
}

#[no_mangle]
pub extern fn add_one_to_vals(numbers: TwoNumbers) -> TwoNumbers {
    numbers.plus_one_to_each()
}

#[no_mangle]
pub extern fn add_struct_vals(numbers: TwoNumbers) -> i32 {
    numbers.first + numbers.second
}

#[no_mangle]
pub extern fn sum(x: i32, y: i32) -> i32 {
    x + y
}

#[test]
fn it_works() {
    assert_eq!(sum(1, 2), 3);
}

#[test]
fn it_works_2() {
    let numbers = TwoNumbers { first: 10, second: 20 };
    assert_eq!(add_struct_vals(numbers), 30);
}

#[test]
fn it_works_3() {
    let numbers = TwoNumbers { first: 10, second: 20 };
    let numbers2 = add_one_to_vals(numbers);
    assert!(numbers2.first == 11 && numbers2.second == 21);
}
