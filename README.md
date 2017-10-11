# site-status-gem
Checks the status of a given site and prints out how long it took to respond

## Usage
Installs a binary called `site-status` that you can call against any site.

What you get back is response time in milliseconds and response code.

If you don't provide an argument, it defaults to https://gitlab.com

e.g.
```
site-status
=> 302 20ms

site-status https://github.com/heymatthew
=> 200 210ms
```

## Installation
Clone this repo, build and install the gem
```
git clone https://github.com/heymatthew/status-gem
cd status-gem
gem build status_checker.gemspec
sudo gem install *.gem
```
