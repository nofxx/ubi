lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'ubi/version'

Gem::Specification.new do |s|
  s.name        = 'ubi'
  s.version     = Ubi::VERSION

  s.authors     = ['Marcos Piccinini']
  s.homepage    = 'http://github.com/nofxx/ubi'
  s.email       = 'x@nofxx.com'
  s.description = 'Find all those devices connected in LAN'
  s.summary     = 'Find devices connected in LAN'
  s.license     = 'MIT'

  s.executables = ['ubi']
  s.default_executable = 'ubi'

  s.files = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths = ['lib']

  s.add_dependency 'thor', '~> 0.19.1'
  s.add_dependency 'paint', '~> 0.9.0'
  s.add_dependency 'phonie', '~> 3.1.0'
  s.add_dependency 'polipus', '~> 0.4.0'
  s.add_dependency 'nokogiri', '~> 1.6.0'
  s.add_dependency 'geopolitical'

  s.add_development_dependency 'vcr'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'webmock'
  # s.add_dependency 'activemodel'
  # s.add_dependency 'activesupport'
end
