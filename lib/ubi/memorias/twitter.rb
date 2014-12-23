module Ubi
  module Memoria
    class Twitter < Base
      class << self
        def name
          'Twitter'
        end

        def key
          :twitter
        end
      end
    end
  end
end
