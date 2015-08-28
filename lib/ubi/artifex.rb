module Ubi
  # Artifex: I work!
  class Artifex
    include Consultor
    attr_accessor :thema

    def initialize(query)
      @thema = Thema.new(query[:name], query[:urls])
      query[:urls] ? fetch_pages : start_with_search
      social_search if query[:mail]
      other_search
      do_the_twist
    end

    def start_with_search
      [Google, Yahoo, Bing, DuckDuckGo].each do |s|
        @thema.try_consultor(s)
      end
    end

    def social_search
    end

    def other_search
    end

    def fetch_pages
      thema.araneas.each(&:work)
    end

    def do_the_twist
      thema.araneas.each { |a| thema.try_datum(a) }
      # pp thema.spec
      # binding.pry if binding.respond_to?(:pry)
    end

    delegate :spec, to: :thema
  end
end
