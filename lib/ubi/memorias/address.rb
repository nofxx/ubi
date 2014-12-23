module Ubi
  module Memoria
    class Address < Base
      class << self

        def parse(datum)
          datum.words.match(regex)
        end

        def regex
          /\w/
        end


        def key
          :address
        end
      end
    end
  end
end
