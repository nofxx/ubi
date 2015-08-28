module Ubi
  module Memoria
    # A site, url and title?
    class Site < Base
      attr_accessor :link, :uri

      def initialize(text, _hint = nil, opts = {})
        text = text.downcase.gsub(/^\(|\.$/, '')
        text = "http://#{text}" unless text =~ %r{^\w{3,5}://}
        @text = text
        @link = tld_parser
        @opts = opts
      end

      def tld_parser
        @uri = URI.parse(text)
        @link = PublicSuffix.parse(uri.host)
      rescue PublicSuffix::DomainInvalid
        nil
      end

      #
      # Prefix http:// if there isn't one defined
      def format
        text
      end

      class << self
        #
        # Regex only for *.tld
        # %r{https?://((?:\w+[\./]?)+)(?:/|\.)}
        # (?:\??)[a-zA-Z0-9\-\._\?\,\'\/\\\+&%\$#\=~]+
        #
        # %r{(?:https?\://)?(?:www\.)?[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,3}}
        #
        # ((?:https\:\/\/)|(?:http\:\/\/)|(?:www\.))?([a-zA-Z0-9\-\.]+\.
        # [a-zA-Z]{2,3}(?:\??)[a-zA-Z0-9\-\._\?\,\'\/\\\+&%\$#\=~]+)
        #
        # http://www.regexr.com/3bkne
        # /([(https?):\/\/(www\.)?a-zA-Z0-9:@%\._\+~#=]{2,256}\.[a-z]{2,6}\b
        # (?:[-a-zA-Z0-9@:%_\+.~#?&\/\/?=]*))/
        #
        # without @
        def regex(_hint)
          %r{
           ([(https?)://(www\.)?a-zA-Z0-9:%\._\+~#=]{2,256}
           \.[a-z]{2,6}\b
           (?:[-a-zA-Z0-9@:%_\+.~#?&//?=]*))
          }x
        end

        def key
          :site
        end
      end
    end
  end
end
