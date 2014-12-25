module Ubi
  module Memoria
    class Address < Base
      class << self

        def regexes
          {
            br: %w{ r rua av avenida pça pç },
            us: /(\d{3}[-]\d{2}[-]\d{4})/
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
