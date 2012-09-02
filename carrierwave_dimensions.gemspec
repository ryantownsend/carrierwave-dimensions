# -*- encoding: utf-8 -*-
require File.expand_path('../lib/carrierwave_dimensions/version', __FILE__)

Gem::Specification.new do |s|
  s.authors       = ["Ryan Townsend"]
  s.email         = ["ryan@ryantownsend.co.uk"]
  s.description   = %q{
    Stores the dimensions of an image after uploading.
    Individual versions can be stored with different columns in the database.
  }
  s.summary       = %q{Stores the dimensions of an image after uploading}
  s.homepage      = "https://github.com/ryantownsend/carrierwave-dimensions"

  s.files         = `git ls-files`.split($\)
  s.executables   = s.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.name          = "carrierwave-dimensions"
  s.require_paths = ["lib"]
  s.version       = CarrierwaveDimensions::VERSION

  s.add_dependency "carrierwave"
  s.add_development_dependency "rspec"
  s.add_development_dependency "mini_magick"
end
