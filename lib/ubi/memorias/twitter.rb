module Ubi
  module Memoria
    class Twitter < Base
      class << self
        def url
          'http://twitter.com'
        end

        def regex
          %r{#{url}/u/\w*}
        end

        def key
          :twitter
        end
      end
    end
  end
end
