build:
	docker build -t ransomwarezz/reportgen:latest .

push: build
	docker push ransomwarezz/reportgen:latest

test: build
	docker run -v="${PWD}:/data/"  --rm -t reportgen:latest example.md example.pdf
test-remote:
	curl  --proto '=https' --tlsv1.2 -L -sSf  https://shortly.fun/genreport  | zsh -s example.md example.pdf
