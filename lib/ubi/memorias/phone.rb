module Ubi
  module Memoria
    # A Phone! mobile? landline? who is calling???

    class Phone < Base

      def initialize(value)
        @value = Phonie.parse(value)
      end

      class << self
        def regex
          /(?:\+?\d{1,3}\W)?(?:\(\d{2,3}\)|\d{2,3}\W)\d{3,5}\W?\d{4}/
        end

        def key
          :phone
        end
      end
    end
  end
end
