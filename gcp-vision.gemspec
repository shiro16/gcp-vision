# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gcp/vision/version'

Gem::Specification.new do |spec|
  spec.name          = "gcp-vision"
  spec.version       = Gcp::Vision::VERSION
  spec.authors       = ["shiro16"]
  spec.email         = ["nyanyanyawan24@gmail.com"]

  spec.summary       = %q{Google Cloud Platform Vision API Simple Client}
  spec.description   = %q{Google Cloud Platform Vision API Simple Client}
  spec.homepage      = "https://github.com/shiro16/gcp-vision"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'httpclient'

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"
end
