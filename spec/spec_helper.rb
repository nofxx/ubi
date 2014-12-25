require 'rubygems'
# require 'pry'
begin
  require 'spec'
rescue LoadError
  require 'rspec'
end

$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'ubi'
include Ubi

if ENV['CI']
  require 'coveralls'
  Coveralls.wear!
end
