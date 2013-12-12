# -*- encoding: utf-8 -*-
VERSION = "0.0.1"

Gem::Specification.new do |spec|
  spec.name          = "truco"
  spec.version       = VERSION
  spec.authors       = ["Ivan Acosta-Rubio"]
  spec.email         = ["ivan@softwarecriollo.net"]
  spec.description   = %q{A game engine to play truco.}
  spec.summary       = %q{A game engine to play truco.}
  spec.homepage      = "http://www.softwarecriollo.com"
  spec.license       = "MIT"

  files = []
  files << 'README.md'
  files.concat(Dir.glob('lib/**/*.rb'))
  spec.files         = files
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rake"
end
