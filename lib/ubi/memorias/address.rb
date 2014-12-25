module Ubi
  module Memoria
    # An adress in this world
    class Address < Base
      class << self
        def regexes
          {
            br: %w( r rua av avenida pç pça praça tv travessa est estrada ),
            us: %w( st street av avenue road )
          }
        end

        def parse(chunk)
          regexes.reduce({}) do |a, k, v|
            a.merge(k => chunk.match(v))
          end
        end

        def key
          :address
        end
      end
    end
  end
end
