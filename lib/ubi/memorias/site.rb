module Ubi
  module Memoria
    # A site, url and title?
    class Site < Base
      #
      # Prefix http:// if there isn't one defined
      def format
        value =~ /http/ ? value : "http://#{value}"
      end

      class << self
        #
        # Regex only for *.tld
        def regex
          # %r{https?://((?:\w+[\./]?)+)(?:/|\.)}
          # (?:\??)[a-zA-Z0-9\-\._\?\,\'\/\\\+&%\$#\=~]+
          # %r{(?:https?\://)?(?:www\.)?[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,3}}
          # ((?:https\:\/\/)|(?:http\:\/\/)|(?:www\.))?([a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,3}(?:\??)[a-zA-Z0-9\-\._\?\,\'\/\\\+&%\$#\=~]+)
          # http://www.regexr.com/3bkne
          # /([(https?):\/\/(www\.)?a-zA-Z0-9:@%\._\+~#=]{2,256}\.[a-z]{2,6}\b(?:[-a-zA-Z0-9@:%_\+.~#?&\/\/?=]*))/
          # without @
          /([(https?):\/\/(www\.)?a-zA-Z0-9:%\._\+~#=]{2,256}\.[a-z]{2,6}\b(?:[-a-zA-Z0-9@:%_\+.~#?&\/\/?=]*))/
        end

        def key
          :site
        end
      end
    end
  end
end
