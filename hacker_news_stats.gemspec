# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hacker_news_stats/version'

Gem::Specification.new do |spec|
  spec.name          = "hacker_news_stats"
  spec.version       = HackerNewsStats::VERSION
  spec.authors       = ["berga"]
  spec.email         = ["marco@bergant.in"]
  spec.summary       = %q{Reads Hacker News feed from URL and display stats.}
  spec.description   = %q{Reads Hacker News feed from URL and display stats from other services as StackOverflow and Twitter.}
  spec.homepage      = ""
  spec.license       = "WTFPL"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_dependency "httparty"
  spec.add_dependency "sax-machine"
  spec.add_dependency "ox", "~> 2.1.2"
  spec.add_dependency "twitter"
  spec.add_dependency "vedeu"
  spec.add_dependency "puma"
  spec.add_dependency "sinatra"
  spec.add_dependency "sinatra-contrib"
  spec.add_dependency "sass"
  spec.add_dependency "haml"
  spec.add_dependency "rack-coffee"
end
