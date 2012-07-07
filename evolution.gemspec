# -*- encoding: utf-8 -*-
require File.expand_path('../lib/evolution/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["asmega"]
  gem.email         = ["asmega@ph-lee.com"]
  gem.description   = %q{See how regularly files are modified using Git. Inspired by Churn.}
  gem.summary       = %q{See how regularly files are modified using Git. Inspired by Churn.}
  gem.homepage      = "https://github.com/asmega/evolution"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "evolution"
  gem.require_paths = ["lib"]
  gem.version       = Evolution::VERSION
end
