module Ubi
  module Memoria
    # A Phone! mobile? landline? who is calling???
    class Phone < Base
      attr_reader :number

      def parser
        @number = Phonelib.parse(text.gsub(/\D/, ''), hint)
      end

      def to_s
        number && number.national
      end

      def rfc
        number && number.international
      end

      class << self
        # http://rubular.com/r/tEHB6KcZzk
        def regex(hint = nil)
          /(?:^|\s)((?:\+\(?\d{1,3}\W)?[\._\-\/\s]*\(?\s*?\d{2,3}\s*?\)?[\._\-\/\s]*\d{3,5}[\._\-\/\s]*\d{4,5})(?:\s|$)/
        end
      end
    end
  end
end
