module Ubi
  module Memoria
    # Memoria Base
    class Base
      include ActiveModel::Validations
      attr_accessor :value, :hint, :opts

      def initialize(value, hint = nil, opts = {})
        @value = value
        @hint = hint
        @opts = opts
        parser
      end

      def parser
        # Implemented on subclasses
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
          fail "Already defined #{base.key}" if Ubi.memorias.include?(base)
          # puts "With memoria #{base}"
          Ubi.memorias << base
        end

        def extract_text(datum)
          case datum
          when String then datum
          when Nokogiri::HTML then datum.data.text
          # when PDF / DOC / IMG (tesseract it =) then datum.data.text
          else fail "Can't parse `#{datum.class}`"
          end
        end

        #
        # Scan for memoria regex and map to new memoria if found
        #
        # @returns Array [Memoria, Memoria...]
        def parse(datum)
          fail "Not implemented by #{self}" unless regex
          extract_text(datum).scan(regex).map { |r| new(r.first) }
        end

        #
        # Machine-readable name of this class
        #
        def key
          @key ||= to_s.split('::').last.downcase.to_sym
          # fail "Not implemented by #{self}"
        end

        #
        # Human-readable name of this class
        #
        def name
          to_s.split('::').last
        end

        def plural
          "#{key}s"
        end

        def ==(other)
          return unless other.respond_to?(:key)
          key == other.key
        end
      end
    end
  end
end
