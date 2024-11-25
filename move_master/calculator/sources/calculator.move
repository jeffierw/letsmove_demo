/// Module: calculator
module calculator::calculator;

use std::debug;

const EDIVIDE_BY_ZERO: u64 = 0;
const ESUB_RESULT_NEGATIVE: u64 = 1;

public struct Output has key, store {
    id: UID,
    result: u64,
}

public entry fun start(ctx: &mut TxContext) {
    let output = Output {
        id: object::new(ctx),
        result: 0,
    };
    transfer::public_transfer(output, ctx.sender());
}

public entry fun add(a: u64, b: u64, ctx: &mut TxContext) {
    let output = Output {
        id: object::new(ctx),
        result: a + b,
    };
    transfer::public_transfer(output, ctx.sender());
}

public entry fun sub(a: u64, b: u64, ctx: &mut TxContext) {
    assert!(b <= a, ESUB_RESULT_NEGATIVE);
    let output = Output {
        id: object::new(ctx),
        result: a - b,
    };
    transfer::public_transfer(output, ctx.sender());
}

public entry fun mul(a: u64, b: u64, ctx: &mut TxContext) {
    let output = Output {
        id: object::new(ctx),
        result: a * b,
    };
    debug::print(&a);
    transfer::public_transfer(output, ctx.sender());
}

public entry fun div(a: u64, b: u64, ctx: &mut TxContext) {
    assert!(b != 0, EDIVIDE_BY_ZERO);
    let output = Output {
        id: object::new(ctx),
        result: a / b,
    };
    transfer::public_transfer(output, ctx.sender());
}
