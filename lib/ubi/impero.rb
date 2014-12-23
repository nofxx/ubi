require 'paint'

module Ubi
  class Impero < Thor
    class_option :verbose, type: :boolean, aliases: :v

    # desc 'init', 'creates settings on ~'
    desc 'find', 'Lookup for something'
    long_desc <<-LONG

    Find something based only on name

    LONG
    option :address, type: :string #, 'Subject\'s address'
    def find(name)
      Ubi::Artifex.new(name).spec
    end
  end
end
