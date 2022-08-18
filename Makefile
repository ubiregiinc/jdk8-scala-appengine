.PHONY: build
build:
	docker buildx build --platform linux/amd64,linux/arm64 -t jdk8-scala-appengine:main --push .

