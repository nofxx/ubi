# require 'pry'
require 'paint'
require 'pry'
require 'vcr'
require 'webmock/rspec'
require 'coveralls'
Coveralls.wear!

$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

VCR.configure do |c|
  c.cassette_library_dir = "#{File.dirname(__FILE__)}/cassettes"
  c.hook_into :webmock
  c.configure_rspec_metadata!
end

require 'ubi'
include Ubi

FIXTURE_PATH = File.join(File.dirname(__FILE__), 'fixtures')

def load_fixture(name)
  File.read(File.join(FIXTURE_PATH, name))
end

if ENV['CI']
  require 'coveralls'
  Coveralls.wear!
end

RSpec.configure do |config|
  config.order = 'random'
  # config.around(:each) do |example|
  #   t = Time.now
  #   print Paint[example.metadata[:full_description], '#999']
  #   # _, vcr = example.metadata[:full_description].split('VCR ')
  #   # VCR.use_cassette(vcr) { example.run }
  #   puts Paint[" [#{Time.now - t}s]", :black]
  # end
  # config.before(:each) { Polipus::SignalHandler.disable }
end
