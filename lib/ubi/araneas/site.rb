require 'polipus'

module Ubi
  module Aranea
    class Site < Base

      delegate :name, to: :thema
      delegate :url, to: :thema

      def crawl!
        Polipus.crawler(name, url) do |crawler|
          # In-place page processing
          crawler.on_page_downloaded do |page|
            # A nokogiri object
            puts "Page title: '#{page.doc.css('title').text}' Page url: #{page.url}"
          end
        end

      end
    end

  end
end
