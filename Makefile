build:
	docker build -t reportgen:latest .
test: build
	docker run -v="${PWD}:/data/"  --rm -t reportgen:latest example.md example.pdf
