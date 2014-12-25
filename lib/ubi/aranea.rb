module Ubi
  module Aranea
    # Base for araneas (spiders)
    class Base
      HEADERS = { 'User-Agent' => "Ubi v#{Ubi::VERSION}" }

      def initialize(thema)
        @thema = thema
      end

      def query_url
        self.class.url + query.to_query
      end

      def links
        '//a'
      end

      def parser(chunk)
        Nokogiri::HTML(chunk)
      end

      def datum
        @datum ||= Ubi::Datum.new(parser(request), words, links)
      end

      #
      # Make an HTTP(S) request to a geocoding API and
      # return the response object.
      #
      def request(opts = {})
        timeout(10) do
          uri = URI.parse(query_url)
          puts "#{self} working on `#{@thema}` (#{query_url}) #{opts}"
          uri.open(HEADERS).read
        end
      end

      class << self
        def inherited(base)
          puts "Using aranea #{base}"
          Ubi.araneas << base
        end

        #
        # Human-readable name of the aranea
        #
        def name
          fail "Not implemented by #{self}"
        end

        #
        # Url to query
        #
        def url
          fail "Not implemented by #{self}"
        end

      end
    end
  end
end
