module Ubi
  module Memoria
    # Memoria Base
    class Base
      include ActiveModel::Validations
      attr_accessor :text, :hint, :opts

      def initialize(text, hint = nil, opts = {})
        @text = text
        @hint = hint
        @opts = opts
        parser
      end

      def parser
        # Implemented on subclasses
      end

      def format
        text
      end

      def to_s
        format
      end

      def ==(other)
        return unless other.respond_to?(:text)
        text == other.text
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
          when Ubi::Aranea then datum.text
          when Nokogiri::HTML then datum.data.text
          # when PDF / DOC / IMG (tesseract it =) then datum.data.text
          else fail "Can't parse `#{datum.class}`"
          end
        end

        #
        # Scan for memoria regex and map to new memoria if found
        #
        # @returns Array [Memoria, Memoria...]
        def parse(datum, hint = :br)
          fail "Not implemented by #{self}" unless defined?(:regex)
          extract_text(datum).scan(regex(hint))
            .map { |r| new(r.first, hint) }
        end

        # Scans and removes matches from original
        #
        def parse!(datum, hint = :br)
          res = parse(datum, hint)
          res.each { |m| datum.tap { |d| d.slice!(m.text) }.strip! }
          res
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
      end
    end
  end
end
