require 'retriever'

module Ubi
  # Base for araneas (spiders)
  class Aranea
    OPTIONS = {
      user_agent: "Ubi v#{Ubi::VERSION}",
      depth_limit: 3,
      logger: Logger.new(STDOUT),
      # redis_options: {
      #   host: 'localhost',
      #   db: 5,
      #   driver: 'hiredis'
      # },
    }
    attr_accessor :thema, :url, :datum, :html, :text, :opts

    def initialize(thema, url, opts = {})
      @thema = thema
      @url   = url
      @opts  = OPTIONS.merge(opts)
      @datum = []
      @html = []
      @text = ''
    end

    delegate :name, to: :thema

    def crawl!
      @last_run = Time.now

      puts "Crawler start #{name} #{url}"
      Retriever::PageIterator.new(url, opts) do |page|
        parse page.source
        p [page.title, page.h1, page.h2]
      end
    end

    def parse(chunk)
      @datum << chunk
      @html << Nokogiri::HTML(chunk)
      @text << html.last.text
    end

    def work
      crawl! unless @last_run
      true
    end

    def to_s
      "#{thema} html: #{html.size} txt: #{text.size}"
    end
  end # Aranea
end # Ubi
