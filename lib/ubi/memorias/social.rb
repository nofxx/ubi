module Ubi
  module Memoria
    # Social account
    class Social < Base
      class << self
        def apps
          {
            twitter: 'twitter.com',
            facebook: 'facebook.com',
            foursquare: 'foursquare.com'
          }
        end

        def regex(url = nil)
          %r{https?://(?:\w+\.)*(#{url}/.*)}
        end
      end
    end
  end
end
