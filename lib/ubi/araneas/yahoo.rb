module Ubi
  module Aranea
    class Yahoo < Base
      #
      # query
      def query
        { p: @thema.name, hspart: 'ubi' }
      end

      def links
        '//a[not (contains(@href,"yahoo"))]'
      end

      def words
        '//li[@class="g"]'
      end

      class << self
        def url
          'https://search.yahoo.com/yhs/search?'
        end
      end
    end
  end
end
