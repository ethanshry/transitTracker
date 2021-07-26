SHELL := /bin/bash

.PHONY: documentation lint cargoclean build-all build-data-req deploy-data-req

documentation:
	cargo doc --open

lint:
	cargo clippy

cargoclean:
	cargo sweep -t 7

build-data-req:
	cd ./data_request && \
	cargo build --release --target x86_64-unknown-linux-musl && \
	cp ./target/x86_64-unknown-linux-musl/release/data_request ./bootstrap && \
	zip lambda.zip bootstrap && \
	rm bootstrap

deploy-data-req: build-data-req
	aws lambda update-function-code --function-name data_request \
	--zip-file fileb://./data_request/lambda.zip \
	--publish && \
	rm ./data_request/lambda.zip