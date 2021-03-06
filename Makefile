.PHONY: release build demo clean

build: clean
	mkdir -p demo/themes/hugo-coder
	rsync -av exampleSite/ demo
	rsync -av --exclude='demo' --exclude='exampleSite' --exclude='.git' . demo/themes/hugo-coder

demo: build

	cd demo && ./hugow serve -D

release: build
	cd ./demo && ./hugow
	rm -rf ./resources && cp -r ./demo/resources ./resources

clean:
	rm -rf demo
