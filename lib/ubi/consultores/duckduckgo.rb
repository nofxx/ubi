module Ubi
  module Consultor
    # URL finder consultor
    class DuckDuckGo < Base
      #
      # query
      def query
        { q: @thema.name, t: 'ubi' }
      end

      def links
        '//a[not (contains(@href,"duckduckgo"))]'
      end

      def words
        '//li[@class="g"]'
      end

      class << self
        def url
          'https://duckduckgo.com/?'
        end
      end
    end
  end
end
