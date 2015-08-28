module Ubi
  module Memoria
    # Show me your papers!

    class Image < Base
      attr_reader :size

      def parser
        @size = []
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
          /\.(jpg|png|svg)$/i
        end
      end
    end
  end
end
