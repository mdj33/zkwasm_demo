use wasm_bindgen::prelude::*;

#[wasm_bindgen]
pub fn zkmain() {
    let pub_input = get_public_input();
    let pri_in = get_private_input();

    assert(pri_in + 3 == pub_input);
}


pub fn get_private_input() -> u64 {
    unsafe { zkwasm_rust_sdk::wasm_input(0) }
}
pub fn get_public_input() -> u64 {
    unsafe { zkwasm_rust_sdk::wasm_input(1) }
}
#[inline(always)]
pub fn debug(n: u64) {
    unsafe {
        zkwasm_rust_sdk::wasm_dbg(n);
    }
}

#[inline(always)]
pub fn assert(cond: bool) {
    unsafe {
        zkwasm_rust_sdk::require(cond);
    }
}

#[inline(always)]
pub fn panic() -> ! {
    assert(false);
    panic!(); // just used to making this function never return.
}
