require 'pry'
require 'thor'
require 'net/http'
require 'net/https'
require 'uri'
require 'open-uri'
require 'json'
require 'nokogiri'
require 'active_model'
require 'active_support'
require 'active_support/core_ext/hash'
require 'ubi/version'

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
