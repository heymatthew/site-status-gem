default: clean build

clean:
	rm *.gem || echo "no gem files"

build:
	gem build status_checker.gemspec
	sudo gem install status_checker-*.gem
