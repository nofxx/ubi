module Ubi
  module Memoria
    class Plus < Base
      class << self
        def url
          'http://plus.google.com'
        end

        def regex
          %r{#{url}/u/\w*}
        end

        def key
          :plus
        end
      end
    end
  end
end
