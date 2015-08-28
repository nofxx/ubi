module Ubi
  module Memoria
    # An Electronic Mail
    class Email < Base
      #
      # Clean up regex on init
      #
      def initialize(text, _hint = nil, opts = {})
        text = text.downcase.gsub(/^\(|\.$/, '')
        @text = text
        # @addr = text
        @opts = opts
      end

      #
      #
      # Class methods
      #
      class << self
        #
        # Email regex
        #
        def regex(_hint)
          %r{
            ([a-z0-9!#$%&'*+/=?^_`{|}~-]+
            (?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@
            (?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+
            (?:[a-z0-9-]*[a-z0-9])?)(?:\W|\s|$)
          }x
        end
      end
    end
  end
end
