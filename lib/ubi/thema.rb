module Ubi
  #
  # Thema -> subject, matter, case
  #
  class Thema
    include ActiveModel::AttributeMethods
    include ActiveModel::Serialization
    include ActiveModel::Dirty

    attr_accessor :name, :urls, :opts, :ascii, :clean

    def initialize(name, urls = [], opts = {})
      @name = name
      @urls = urls
      @name ||= urls.first.split('.').first.gsub(%r{^\w+://}, '')
      @urls = @urls.map { |url| url =~ %r{://} ? url : "http://#{url}" }
      @opts = opts
      @cache = Ubi.memorias.reduce({}) { |a, e| a.merge(e => opts[e]) }
      reduce_names
    end

    def araneas
      @araneas ||= urls.map { |u| Aranea.new(self, u) }
    end

    def reduce_names
      return unless name
      @ascii = name.mb_chars.downcase
      @downcase = name.mb_chars.downcase
      @clean = @downcase.gsub(/\W/, ' ')
    end

    # Define memorias on thema
    Ubi.memorias.each do |memoria|
      define_method memoria.plural do
        instance_variable_get("@#{memoria.plural}") ||
          instance_variable_set("@#{memoria.plural}", [])
      end
    end

    def spec
      puts self
      Ubi.memorias.each do |memoria|
        d = send(memoria.plural)
        puts Paint["#{memoria.name} (#{d.size})", :black]
        puts d
      end
    end

    def try_datum(a)
      Ubi.memorias.each do |m|
        print Paint["Trying to find #{m} in page ", :green]
        matches = m.parse(a)
        puts Paint[matches.size, :black]
        next unless matches && !matches.empty?
        matches.each do |match|
          send(m.plural) << match unless send(m.plural).include?(match)
        end
      end
    end

    def to_s
      name
    end
  end
end
