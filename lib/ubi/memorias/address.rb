module Ubi
  module Memoria
    # An adress in this world
    class Address < Base
      DIVIDERS = /[,\-\|\/]/
      SPLIT = /(?<=\D)#{DIVIDERS}|#{DIVIDERS}(?=\D)/
      REGEXES = {
        br: {
          prefix: %w( r rua av avenida pç pça praça pc pca praca tv travessa est estrada rod rodovia ),
          number: %w( n no nº num numero km ),
          ext: %w( comp obs ap apto apart apartamento andar  ),
          zip: /\d{5}[-]\d{3}/
        },
        us: {
          prefix: %w( st street av avenue road ),
          zip: /\d{5}/
        }
      }

      attr_accessor :name, :parts, :words, :zip, :place, :number,
                    :city, :region, :nation, :extra
      #
      #
      # Init, remove non word chars
      #
      def initialize(val, location = :br)
        @value = Address.sanitize(val)
        @zip = value.match(REGEXES[location][:zip])
        @region = value.match(/\W([A-Z]{2})\W/)[1]
        @number = value.match(/\w*\d+\w*/)

        @parts = value.split(SPLIT).map { |v| v.strip.chomp }
        @words = parts.map { |pt| pt.split(/\s+/) }
      end

      def format(location = :br)
        value.sub(*self.class.formats[location])
      end

      class << self
        #
        # Sanitizing
        #
        # ".." -> "."
        # "\n" -> "-"
        # " -" -> "-"
        #
        def sanitize(value)
          value.gsub(/\s+/, ' ').gsub(/\\n/, '-')
            .gsub(/\s?(#{DIVIDERS})\s?/, '\1')
        end

        def formats
          {
            br: '%a, %n - %c %z %r',
            br: '%a, %n - %c %z %r',
            br: '%a, %n - %c %z %r'
          }
        end

        def regex
          /(?:#{REGEXES[:br][:prefix].join('|')}).*/i
        end

        def plural
          :addresses
        end
      end
    end
  end
end
