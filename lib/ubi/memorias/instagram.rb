module Ubi
  module Memoria
    class Instagram < Base
      class << self
        def url
          'http://instagram.com'
        end

        def regex
          %r{#{url}/u/\w*}
        end

        def key
          :instagram
        end
      end
    end
  end
end
