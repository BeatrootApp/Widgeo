# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'widgeo/version'

Gem::Specification.new do |spec|

  spec.name          = "widgeo"
  spec.version       = Widgeo::VERSION
  spec.authors       = ["Chris G"]
  spec.email         = ["chris@abstraktion.co.uk"]
  spec.summary       = "Provides easy access to the worlds territories and their continents."
  spec.description   = "Listing and filtering of continents and territories. Includes short names, long names and alpha codes, following the ISO 3166 standard."
  spec.homepage      = "https://github.com/BeatrootApp/Widgeo"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_development_dependency "rspec", "~> 3.1"

end
