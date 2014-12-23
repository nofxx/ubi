module Ubi
  module Memoria
    class Facebook < Base

      class << self
        def url
          'facebook.com'
        end

        def regex
          %r{https?://(?:\w+\.)*(#{url}/.*)}
        end

        def key
          :facebook
        end
      end
    end
  end
end
