module Ubi
  module Memoria
    class Site < Base

      class << self
        def name
          'Website'
        end

        def key
          :site
        end
      end
    end
  end
end
