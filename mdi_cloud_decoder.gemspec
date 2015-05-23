# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mdi_cloud_decoder/version'

Gem::Specification.new do |spec|
  spec.name          = "mdi_cloud_decoder"
  spec.version       = MdiCloudDecoder::VERSION
  spec.authors       = ["Tyler Sampson"]
  spec.email         = ["tyler_sampson@tresblue.com"]
  spec.summary       = "Utilities for decoding mdi cloud notifications"
  spec.description   = "Utilities for decoding mdi cloud notifications"
  spec.homepage      = "http://github.com/tylersampson/mdi_cloud_connect"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'rspec'
end
