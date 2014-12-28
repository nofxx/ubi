require 'pry'
require 'thor'
require 'net/http'
require 'net/https'
require 'uri'
require 'open-uri'
require 'json'
require 'phonie'
require 'nokogiri'
require 'active_model'
require 'active_support'
require 'active_support/core_ext/hash'
require 'ubi/version'

# Ubiquous getters
module Ubi
  cattr_accessor(:memorias) { [] }
  cattr_accessor(:araneas) { [] }

  Phonie.configuration.default_country_code = '55'
  Phonie.configuration.n1_length = 4
end

require 'ubi/aranea'
require 'ubi/memoria'
require 'ubi/consultor'

%w( memorias consultores ).each do |ns|
  Dir["#{File.dirname(__FILE__)}/ubi/#{ns}/**.rb"].sort.each do |lib|
    require lib
  end
end

# Loads after all
require 'ubi/artifex'
require 'ubi/datum'
require 'ubi/thema'
