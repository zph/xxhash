src = $(wildcard bin/*.cr) $(wildcard src/**/*.cr)
DIR := ${CURDIR}

play:
	crystal play src/kit.cr

test: fmt
	crystal spec

tag:
	git tag -a v$(./bin/run -- --version) -m "$(./bin/run -- --version)"

fmt: $(src)
	crystal tool format

deps:
	bash bin/install_deps.sh

clean:
	rm -rf ./vendor/*

.PHONY: play fmt clean
