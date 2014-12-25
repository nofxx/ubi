module Ubi
  module Memoria
    class Site < Base

      class << self
        def parse(datum)
          datum.links.join(' ').scan(regex)
        end

        def regex
          /https?:\/\/((?:\w+[\.\/]?)+)(?:\/|\.)/
          # ((?:https\:\/\/)|(?:http\:\/\/)|(?:www\.))?([a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,3}(?:\??)[a-zA-Z0-9\-\._\?\,\'\/\\\+&%\$#\=~]+)
        end

        def key
          :site
        end
      end
    end
  end
end
