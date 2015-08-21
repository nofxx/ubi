module Ubi
  module Memoria
    # An Electronic Mail
    class Email < Base
      #
      #
      # Class methods
      #
      class << self
        #
        # Email regex
        #
        def regex
          %r{([a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?)} # rubocop:disable Metrics/LineLength
        end
      end
    end
  end
end
