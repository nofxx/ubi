module Ubi
  module Memoria
    class Site < Base

      class << self
        def parse(datum)
          datum.links.join(' ').scan(regex)
        end

        def regex
          /https?:\/\/((?:\w+[\.\/]?)+)(?:\/|\.)/
        end

        def key
          :site
        end
      end
    end
  end
end
