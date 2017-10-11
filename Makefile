default: clean build

clean:
	rm *.gem

build:
	gem build status_checker.gemspec
	sudo gem install status_checker-*.gem
