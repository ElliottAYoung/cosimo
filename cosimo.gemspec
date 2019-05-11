lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "cosimo/version"

Gem::Specification.new do |spec|
  spec.name          = "cosimo"
  spec.version       = Cosimo::VERSION
  spec.authors       = ["ElliottAYoung"]
  spec.email         = ["elliott.a.young@gmail.com"]

  spec.summary       = 'An MVC framework designed for Pure-Ruby, Asynchronous Microservices'
  spec.description   = 'An MVC framework designed for Pure-Ruby, Asynchronous Microservices. Built as a lightweight Ruby solution to connect to Asynchronous messaging queues for a Resource driven, async API. Designed to use many of the best parts fo Rails without much of the other, heavy components that come along with a standard Rails app.'
  spec.homepage      = "https://github.com/ElliottAYoung/cosimo"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.bindir        = "bin"
  spec.executables   = ["cos"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_dependency "pry", "~> 0.12"
  spec.add_dependency "rb-readline", "~> 0.5"
  spec.add_dependency "puma", "~> 3.12"
  spec.add_dependency "activesupport", "~> 5.2"
end
