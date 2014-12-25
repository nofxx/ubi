require 'polipus'

module Ubi
  module Aranea
    # The site crawler
    class Site < Base
      delegate :name, to: :thema
      delegate :url, to: :thema

      def crawl!
        Polipus.crawler(name, url) do |crawler|
          # In-place page processing
          crawler.on_page_downloaded do |page|
            # A nokogiri object
            puts "'#{page.doc.css('title').text}' (#{page.url})"
          end
        end
      end
    end
  end
end
