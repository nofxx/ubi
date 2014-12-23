require 'thor'
require 'active_model'
require 'active_support'

module Ubi
  cattr_accessor(:memorias) { [] }
  cattr_accessor(:araneas) { [] }
end

require 'ubi/thema'
require 'ubi/datum'
require 'ubi/memoria'
require 'ubi/aranea'
require 'ubi/artifex'

%w{ memorias araneas }.each do |ns|
  Dir["#{File.dirname(__FILE__)}/ubi/#{ns}/**.rb"].sort.each do |lib|
    require lib
  end
end
