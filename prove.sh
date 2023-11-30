#!/bin/bash

set -e
set -x

# rm -rf output

# Single test
RUST_LOG=info cargo run --release -- -f zkmain --wasm ctest/zkdemo_bg.wasm dry-run --private 1:i64 --public 4:i64

RUST_LOG=info cargo run --release  -- -k 18 --function zkmain --output ./output --wasm ctest/zkdemo_bg.wasm setup
RUST_LOG=info cargo run --release  -- -k 18 --function zkmain --output ./output --wasm ctest/zkdemo_bg.wasm single-prove --private 1:i64 --public 4:i64
RUST_LOG=info cargo run --release  -- -k 18 --function zkmain --output ./output --wasm ctest/zkdemo_bg.wasm single-verify --proof output/zkwasm.0.transcript.data --instance output/zkwasm.0.instance.data


#RUST_LOG=info cargo run --release  -- -k 20 --function zkmain --output ./output --wasm ctest/bls.wasm aggregate-prove
#RUST_LOG=info cargo run --release  -- -k 20 --function zkmain --output ./output --wasm ctest/bls.wasm aggregate-verify --proof output/aggregate-circuit.0.transcript.data  --instances output/aggregate-circuit.0.instance.data

