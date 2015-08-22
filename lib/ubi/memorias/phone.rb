module Ubi
  module Memoria
    # A Phone! mobile? landline? who is calling???
    class Phone < Base
      attr_reader :number

      def parser
        @number = Phonelib.parse(text.gsub(/\D/, ''), hint)
      end

      def format
        number && number.e164
      end

      def national
        number && number.national
      end

      def international
        number && number.international
      end

      class << self
        # http://rubular.com/r/tEHB6KcZzk
        def regex(hint = nil)
          /
            (?:^|\s)((?:\+\(?\d{1,3}\W)?[\._\-\/\s]*
            \(?\s*?\d{2,3}\s*?\)?[\._\-\/\s]*\d{3,5}
            [\._\-\/\s]*\d{4,5})(?:\s|$)
          /x
        end
      end
    end # Phone
  end # Memoria
end # Ubi
