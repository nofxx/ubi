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
        def regex(_hint)
          %r{
            ([a-z0-9!#$%&'*+/=?^_`{|}~-]+
            (?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@
            (?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+
            (?:[a-z0-9-]*[a-z0-9])?)
          }x
        end
      end
    end
  end
end
