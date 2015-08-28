module Ubi
  module Memoria
    # Whoami
    class Who < Base
      class << self
        def apps
          {
            twitter: 'twitter.com',
            facebook: 'facebook.com',
            foursquare: 'foursquare.com'
          }
        end

        def regex(url)
          %r{https?://(?:\w+\.)*(#{url}/.*)}
        end
      end
    end
  end
end
