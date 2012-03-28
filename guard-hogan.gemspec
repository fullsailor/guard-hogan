# -*- encoding: utf-8 -*-
require File.expand_path('../lib/guard/hogan/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Andrew Smith"]
  gem.email         = ["fullsailor@me.com"]
  gem.description   = %q{Compiles your Hogan mustache templates with Guard}
  gem.summary       = %q{Compiles your Hogan mustache templates with Guard}
  gem.homepage      = "http://github.com/fullsailor/guard-hogan"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = [] #gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "guard-hogan"
  gem.require_paths = ["lib"]
  gem.version       = Guard::HoganVersion::VERSION

  gem.add_runtime_dependency "execjs", "~> 1.3.0"
  gem.add_runtime_dependency "guard", "~> 1.0.1"
end
