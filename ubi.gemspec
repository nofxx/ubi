lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'ubi/version'

Gem::Specification.new do |s|
  s.name        = 'ubi'
  s.version     = Ubi::VERSION
  s.platform    = Gem::Platform::RUBY

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

  s.add_dependency 'thor'
  s.add_dependency 'paint'
  s.add_dependency 'phonelib'
  #  s.add_dependency 'addressie', '~> 0.0.0'
  s.add_dependency 'nokogiri'
  s.add_dependency 'whatlanguage'
  s.add_dependency 'geopolitical'
  s.add_dependency 'public_suffix'
  s.add_dependency 'rubyretriever'
  s.add_dependency 'charlock_holmes'

  s.add_development_dependency 'vcr'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'webmock'
  # s.add_dependency 'activemodel'
  # s.add_dependency 'activesupport'
end
