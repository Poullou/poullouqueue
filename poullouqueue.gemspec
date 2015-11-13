$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |spec|
  spec.name           = 'poullouqueue'
  spec.version        = '0.0.1'
  spec.date           = '2015-11-13'
  spec.summary        = 'Queue management'
  spec.description    = 'Queue management with callbacks on event'
  spec.authors        = ['Poullou']
  spec.email          = 'poullou.dev@gmail.com'
  spec.files          = `git ls-files`.split("\n")
  spec.test_files     = `git ls-files -- {test,spec,features}/*`.split("\n")
  spec.require_paths  = ['lib']
  spec.homepage       = 'https://github.com/Poullou/poullouqueue'
  spec.license        = 'MIT'
end
