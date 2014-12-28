module Ubi
  module Consultor
    # URL finder consultor
    class Bing < Base
      #
      # query
      def query
        { q: @thema.name, pc: 'ubi' }
      end

      def links
        '//a[not (contains(@href,"bing"))]'
      end

      def words
        '//li[@class="g"]'
      end

      class << self
        def url
          'https://bing.com/search?'
        end
      end
    end
  end
end
