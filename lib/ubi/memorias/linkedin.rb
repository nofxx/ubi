module Ubi
  module Memoria
    class Linkedin < Base
      class << self
        def url
          'instagram.com'
        end

        def regex
          %r{(?:https?://)?(?:www\.)?#{url}/u/\w*}
        end

        def key
          :address
        end
      end
    end
  end
end
