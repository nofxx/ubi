module Ubi
  module Memoria
    # Memoria Base
    class Base
      include ActiveModel::Validations
      attr_accessor :value

      def initialize(value, aranea = nil, thema = nil)
        @value = value
        @aranea = aranea
        @thema = thema
      end

      # Format for #to_s
      def format
        value.downcase
      end

      def to_s
        format
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
          extract_text(datum).scan(regex).map { |r| new(r) }
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
          to_s.split('::').last
        end
      end
    end
  end
end
