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

        def extract_text(datum)
          case datum
          when String then datum
          when Nokogiri::HTML then datum.data.text
          else fail "Can't parse `#{datum.class}`"
          end
        end

        def parse(datum)
          fail "Not implemented by #{self}" unless regex
          extract_text(datum).scan(regex)
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
