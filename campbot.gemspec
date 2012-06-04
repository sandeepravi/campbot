# -*- encoding: utf-8 -*-
require File.expand_path('../lib/campbot/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Sandeep"]
  gem.email         = ["sandeep.ravichandran@sourcebits.com"]
  gem.description   = "Simple framework to write a campfire bot"
  gem.summary       = "Simple framework to write a campfire bot"
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "campbot"
  gem.require_paths = ["lib"]
  gem.version       = Campbot::VERSION
  gem.add_development_dependency "rspec"
  gem.add_development_dependency "webmock"
  gem.add_dependency "yajl-ruby"
end
