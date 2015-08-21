require 'polipus'

module Ubi
  # Base for araneas (spiders)
  class Aranea
    OPTIONS = {
      workers: 3,
      user_agent: "Ubi v#{Ubi::VERSION}",
      depth_limit: 1

      # storage: MemoryStore
    }
    attr_accessor :thema, :url, :datum

    def initialize(thema, url, opts = {})
      @thema = thema
      @url   = url
      @opts  = opts
    end

    delegate :name, to: :thema

    def crawl!
      Polipus.crawler(name, url, OPTIONS.merge(@opts)) do |crawler|
        # In-place page processing
        crawler.on_page_downloaded do |page|
          # A nokogiri object
          puts "'#{page.doc.css('title').text}' (#{page.url})"
        end
      end
    end

    def parser(chunk)
      Nokogiri::HTML(chunk)
    end

    def datum
      crawl! unless @datum
      @datum
    end
  end
end
