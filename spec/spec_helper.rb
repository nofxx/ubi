# require 'pry'
require 'paint'
require 'pry'
require 'vcr'
require 'webmock/rspec'

$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

VCR.configure do |c|
  c.cassette_library_dir = "#{File.dirname(__FILE__)}/cassettes"
  c.hook_into :webmock
end

require 'ubi'
include Ubi

if ENV['CI']
  require 'coveralls'
  Coveralls.wear!
end

RSpec.configure do |config|
  config.order = 'random'
  config.around(:each) do |example|
    t = Time.now
    print Paint[example.metadata[:full_description], '#999']
    _, vcr = example.metadata[:full_description].split("VCR")
    VCR.use_cassette(vcr) { example.run }
    puts Paint[" [#{Time.now - t}s]", :black]
  end
  config.before(:each) { Polipus::SignalHandler.disable }
end
