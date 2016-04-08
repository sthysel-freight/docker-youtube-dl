.PHONY: all build testrun push

all: build

Dockerfile: Dockerfile.in
	cp $< $@
	sed -i "s/__GID__/$$(id -g)/g" $@
	sed -i "s/__UID__/$$(id -u)/g" $@

build: Dockerfile
	docker build -t sthysel/youtubedl .

testrun:
	docker run -it --rm -v ${PWD}:/download sthysel/youtubedl

push:
	docker push sthysel/youtubedl

