module Ubi
  module Memoria
    # Show me your papers!
    #
    # https://en.wikipedia.org/wiki/National_identification_number
    #
    # br: CNPJ
    # us: SSN
    # cl: RUN/RUT
    #
    class Document < Base
      #
      #
      # Init, remove non word chars
      #
      def initialize(value)
        @value = value.gsub(/\W/, '')
      end

      def format(location = :br)
        value.sub(*self.class.formats[location])
      end

      #
      # Class methods
      #
      class << self
        def regexes
          {
            br: /(\d{14}|\d{2}\.?\d{3}\.?\d{3}\/?\d{4}[-]?\d{2})/,
            cl: /\d{2}\.\d{3}\.\d{3}[-][0-9kK]/,
            us: /\d{3}[-]\d{2}[-]\d{4}/
          }
        end

        def formats
          {
            br: [/(\d{2})(\d{3})(\d{3})(\d{4})(\d{2})/, '\1.\2.\3/\4-\5'],
            cl: [/(\d{2})(\d{3})(\d{3})(\d{1})/, '\1.\2.\3-\4'],
            us: [/(\d{3})(\d{2})(\d{4})/, '\1-\2-\3']
          }
        end

        def regex(location = :br)
          regexes[location]
        end
      end
    end
  end
end
