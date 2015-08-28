require 'pry'
require 'thor'
require 'paint'

module Ubi
  # Impero: I command!
  class Impero < Thor
    class_option :verbose, type: :boolean, aliases: :v

    # desc 'init', 'creates settings on ~'
    desc 'find', 'Lookup for something'
    long_desc <<-LONG

    Find something based only on name

    LONG
    option :address, type: :string # 'Subject\'s address'
    def find(name)
      Ubi::Artifex.new(name: name).spec
    end

    # desc 'init', 'creates settings on ~'
    desc 'site', 'Lookup in site'
    long_desc <<-LONG

    Find data on URL

    LONG
    option :address, type: :string # 'Subject\'s address'
    def site(*url)
      Ubi::Artifex.new(urls: url).spec
    end
  end
end
