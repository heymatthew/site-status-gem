# site-status-gem
Checks the status of https://gitlab.com and prints out how long it took to respond

## Usage
Installs a binary called `site-status` that you can call against any site.

What you get back is response time in milliseconds and response code.

e.g.
```
site-status https://matthew.nz
=> 302 30ms
```

## Installation
Clone this repo, build and install the gem
```
git clone https://github.com/heymatthew/status-gem
cd status-gem
gem build status_checker.gemspec
sudo gem install *.gem
```
