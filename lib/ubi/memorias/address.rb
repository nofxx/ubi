module Ubi
  module Memoria
    # An adress in this world
    class Address < Base
      DIVIDERS = /[,\-\|\/]/
      SPLIT = /(?<=\D)#{DIVIDERS}|#{DIVIDERS}(?=\D)/
      REGEXES = {
        br: {
          prefix: %w( r rua av avenida pc pca praça pc pca praca tv travessa est estrada rod rodovia ),
          number: %w( n no nº num numero km ),
          ext: %w( comp obs ap apto apart apartamento andar ),
          zip: /\d{5}\s?[-]\s?\d{3}/
        },
        us: {
          prefix: %w( st street av avenue road ),
          zip: /\d{5}/
        }
      }

      attr_accessor :name, :parts, :words, :zip, :place, :number,
                    :city, :region, :nation, :extra, :clean
      #
      #
      # Init, remove non word chars
      #
      def parser
        @clean = Address.sanitize(chunk)
        # @zip = chunk.match(REGEXES[location][:zip])

        @parts = clean.split(SPLIT).map { |v| v.strip.chomp }
        @words = parts.map { |pt| pt.split(/\s+/) }
        @zip = chunk.scan(REGEXES[:br][:zip]).first
        if zip
          @zip = zip.gsub(/\D/, '').sub(*Address.zip_format[:br])
          clean.slice!(zip)
        end
        @region = clean.scan(/\W([A-Z]{2})\W/).first.first
        @number = clean.scan(/\d+/).join(' ')
      end

      def format(location = :br)
        chunk.sub(*self.class.formats[location])
      end

      class << self
        #
        # Sanitizing
        #
        # ".." -> "."
        # "\n" -> "-"
        # " -" -> "-"
        #
        def sanitize(txt)
          v = ActiveSupport::Inflector.transliterate(txt)
          v.gsub(/\s+/, ' ').gsub(/\\n/, '-')
            .gsub(/\s?(#{DIVIDERS})\s?/, '\1')
        end

        def formats
          {
            # br: '%a, %n - %c %z %r',
            # br: '%a, %n - %c %z %r',
            br: '%a, %n - %c %z %r'
          }
        end

        def zip_format
          {
            br: [/(\d{5})(\d{3})/, '\1-\2']
          }
        end

        def regex
          /((?:#{REGEXES[:br][:prefix].join('|')}).*)/i
        end

        def plural
          :addresses
        end
      end
    end
  end
end
