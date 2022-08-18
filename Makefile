.PHONY: build
build:
	docker buildx build --platform linux/amd64,linux/arm64 -t ghcr.io/ubiregiinc/jdk8-scala-appengine:main --push .

