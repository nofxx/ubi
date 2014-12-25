module Ubi
  module Memoria
    class Who < Base

      class << self
        def apps
          {
            twitter: 'twitter.com',
            facebook: 'facebook.com',
            foursquare: 'foursquare.com'
          }
        end

        def regex
          %r{https?://(?:\w+\.)*(#{url}/.*)}
        end

        def key
          :social
        end
      end
    end
  end
end
