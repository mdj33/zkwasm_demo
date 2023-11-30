
build:
	wasm-pack build --release --out-name zkdemo_wasm_bg.wasm
	wasm-opt -O3 -o pkg/zkdemo_wasm_opt.wasm pkg/zkdemo_wasm_bg.wasm
	find ./pkg -type f  ! -name "*.wasm" -delete


