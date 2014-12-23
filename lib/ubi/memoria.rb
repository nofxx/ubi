module Ubi
  module Memoria
    class Base
      include ActiveModel::Validations

      def initialize(value, aranea, thema)
        @value = value
        @aranea = aranea
        @thema = thema
      end

      class << self
        #
        # Account for memorias
        #
        def inherited(base)
          puts "With memoria #{base}"
          Ubi.memorias << base
        end

        def parse(datum)
          fail "Not implemented by #{self}" unless regex
          datum.data.text.scan(regex)
        end

        #
        # Human-readable name of the aranea
        #
        def key
          fail "Not implemented by #{self}"
        end

        #
        # Human-readable name of the aranea
        #
        def name
          self.to_s.split('::').last
        end

      end
    end
  end
end
