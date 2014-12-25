module Ubi
  module Memoria
    class Document < Base
      class << self

        def regexes
          {
            br: /^\d{14}|\d{2}\.\d{3}\.\d{3}\/\d{4}-\d{2}$/,
            us: /(\d{3}[-]\d{2}[-]\d{4})/
          }
        end



        def key
          :email
        end
      end
    end
  end
end
