module Ubi
  module Aranea
    class Base

      def initialize(thema)
        @thema = thema
      end

      def data
        Ubi::Datum.new(@data)
      end

      ##
      # Make an HTTP(S) request to a geocoding API and
      # return the response object.
      #
      def make_request(query)
        timeout(10) do
          uri = URI.parse(query_url(query))
          args = [uri.host, uri.port]
          args = args.push(uri.user, uri.password) unless uri.user.nil? or uri.password.nil?
          opts = {}
          #opts[:use_ssl] = use_ssl?
          http_client.start(*args, opts) do |client|
            client.get(uri.request_uri, configuration.http_headers)
          end
        end
      end

      def work(url)

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
          fail
        end

        #
        # Url to query
        #
        def url
          fail
        end

      end
    end
  end
end
