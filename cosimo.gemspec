
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "cosimo/version"

Gem::Specification.new do |spec|
  spec.name          = "cosimo"
  spec.version       = Cosimo::VERSION
  spec.authors       = ["ElliottAYoung"]
  spec.email         = ["elliott.a.young@gmail.com"]

  spec.summary       = 'An MVC framework designed for Pure-Ruby, Asynchronous Microservices'
  spec.description   = 'An MVC framework designed for Pure-Ruby, Asynchronous Microservices'
  spec.homepage      = ""
  spec.license       = ""

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
