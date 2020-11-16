build:
	docker build -t reportgen:latest .
test: build
	docker run -v="${PWD}:/data/"  --rm -t reportgen:latest example.md example.pdf
test-remote:
	curl  --proto '=https' --tlsv1.2 -L -sSf  https://shortly.fun/genreport  | zsh -s example.md example.pdf
