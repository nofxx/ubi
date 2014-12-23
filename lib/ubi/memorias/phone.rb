module Ubi
  module Memoria
    class Phone < Base



      class << self

        def regex
          /(?:\+?\d{1,3}\W)?(?:\(\d{2,3}\)|\d{2,3}\W)\d{3,5}\W?\d{4}/
        end

        def name
          "Phone"
        end

        def key
          :phone
        end
      end
    end
  end
end
