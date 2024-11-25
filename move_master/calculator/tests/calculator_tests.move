#[test_only]
module calculator::calculator_tests;

use calculator::calculator;
use std::debug;
use sui::test_scenario;

#[test]
fun test_calculator() {
    let mut sc = test_scenario::begin(@0x1);
    let a: u64 = 1;
    let b: u64 = 2;
    calculator::add(a, b, sc.ctx());
    debug::print(sc.ctx().digest());
    test_scenario::end(sc);
}

#[test, expected_failure(abort_code = ::calculator::calculator::EDIVIDE_BY_ZERO)]
fun test_calculator_div_fail() {
    // error
    let a: u64 = 1;
    let b: u64 = 0;
    let mut sc = test_scenario::begin(@0x1);
    calculator::div(a, b, sc.ctx());
    test_scenario::end(sc);
}

#[test, expected_failure(abort_code = ::calculator::calculator::ESUB_RESULT_NEGATIVE)]
fun test_calculator_sub_fail() {
    // error
    let a: u64 = 1;
    let b: u64 = 2;
    let mut sc = test_scenario::begin(@0x1);
    calculator::sub(a, b, sc.ctx());
    test_scenario::end(sc);
}
