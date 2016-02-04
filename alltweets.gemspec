# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'alltweets/version'

Gem::Specification.new do |spec|
  spec.name          = "alltweets"
  spec.version       = AllTweets::VERSION
  spec.authors       = ["Tatsuya Otsuka"]
  spec.email         = ["tatzyr@gmail.com"]

  spec.summary       = %q{Downloads someone's all tweets.}
  spec.homepage      = "https://github.com/Tatzyr/all_tweets"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "colorize", "~> 0.7.7"
  spec.add_dependency "launchy", "~> 2.4.3"
  spec.add_dependency "oauth", "~> 0.4.7"
  spec.add_dependency "oj", "~> 2.14.1"
  spec.add_dependency "trollop", '~> 2.1.2'
  spec.add_dependency "twitter", "~> 5.15"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
