Gem::Specification.new do |spec|
  spec.name        = 'poulloustack'
  spec.version     = '0.0.1'
  spec.date        = '2015-11-09'
  spec.summary     = 'Stack management'
  spec.description = 'Stack management with callbacks on event'
  spec.authors     = ['Poullou']
  spec.email       = 'poullou.dev@gmail.com'
  spec.files       = Dir['lib/**/*']
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.homepage    = 'https://github.com/Poullou/poulloustack'
  spec.license     = 'MIT'
end
