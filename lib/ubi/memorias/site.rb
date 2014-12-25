module Ubi
  module Memoria
    # A site, url and title?
    class Site < Base

      def format
        value =~ /http/ ? value : "http://#{value}"
      end

      class << self

        def regex
          # %r{https?://((?:\w+[\./]?)+)(?:/|\.)}
          # (?:\??)[a-zA-Z0-9\-\._\?\,\'\/\\\+&%\$#\=~]+
          /(?:https?\:\/\/)?(?:www\.)?[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,3}/
        end

        def key
          :site
        end
      end
    end
  end
end
