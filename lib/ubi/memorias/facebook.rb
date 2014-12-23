module Ubi
  module Memoria
    class Facebook < Base

      class << self
      def name
        "Facebook"
      end

      def key
        :facebook
      end
      end
    end
  end
end
