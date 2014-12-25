module Ubi
  module Aranea
    # URL finder aranea
    class Google < Base # HTML
      def query
        { q: @thema.name }
      end

      def links
        '//a[not (contains(@href,"google"))]'
      end

      def words
        '//div[@class="res"]'
      end

      class << self
        def url
          'https://www.google.com.br/search?'
        end
      end
    end
  end
end
