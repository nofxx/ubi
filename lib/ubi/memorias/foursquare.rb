module Ubi
  module Memoria
    class Foursquare < Base
      class << self
        def url
          'http://foursquare.com'
        end

        def regex
          %r{#{url}/u/\w*}
        end

        def key
          :foursquare
        end
      end
    end
  end
end
