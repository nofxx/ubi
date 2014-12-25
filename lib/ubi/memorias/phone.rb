module Ubi
  module Memoria
    # A Phone! mobile? landline? who is calling???
    class Phone < Base
      SPLIT = '[\._\-/\s]*'

      def initialize(value)
        @value = Phonie::Phone.parse(value.gsub(/\D/, ''))
      end

      def to_s
        value && value.format(:us)
      end

      class << self
        def regex
          /(?:\+?\d{1,3}\W)?#{SPLIT}\(?\d{2,3}\)?#{SPLIT}\d{3,5}#{SPLIT}\d{4,5}/
        end

        def key
          :phone
        end
      end
    end
  end
end
