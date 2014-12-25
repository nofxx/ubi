module Ubi
  # Artifex: I work!
  class Artifex
    include Aranea
    attr_accessor :thema

    def initialize(query)
      @thema = Thema.new(query)
      start_with_search
      social_search
      other_search
    end

    def start_with_search
      [Google, Yahoo, Bing, DuckDuckGo].each do |s|
        @thema.try_aranea(s)
      end
    end

    def social_search
    end

    def other_search
    end

    delegate :spec, to: :thema
  end
end
