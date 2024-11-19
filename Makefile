

# can change this to npx instead
runner = bun x

.PHONY: clean-build
clean-build:
	rm -rf build/

.PHONY: build-sw build-app build-content

build-sw: clean-build
	$(runner) vite build --mode service-worker

build-app: clean-build
	$(runner) vite build --mode app

build-content: clean-build
	$(runner) vite build --mode content 

.PHONY: build build-app build-content build-sw 
build: build-app build-content build-sw 
	./tasks/build.fish

test:
	$(runner) vitest

.PHONY: test
