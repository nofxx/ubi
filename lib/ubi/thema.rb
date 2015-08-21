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
      @opts = opts
      @cache = Ubi.memorias.reduce({}) { |a, e| a.merge(e => opts[e]) }
      reduce_names
    end

    def araneas
      @araneas ||= urls.map { |u| Aranea.new(self, u) }
    end

    def reduce_names
      @ascii = name.mb_chars.downcase
      @downcase = name.mb_chars.downcase
      @clean = @downcase.gsub(/\W/, ' ')
    end

    Ubi.memorias.each do |memoria|
      define_method memoria.plural do
        instance_variable_get('@' + memoria.plural) ||
          instance_variable_set('@' + memoria.plural, [])
      end
    end

    def [](arg)
      @cache[arg]
    end

    def spec
      puts self
      Ubi.memorias.each do |memoria|
        print Paint[memoria.name, :black]
        puts self[memoria.key]
      end
    end

    def try_consultor(a)
      a = a.new(self)
      Ubi.memorias.each do |m|
        puts Paint["Trying to find #{m} in #{a.class}", :green]
        @cache[m] = matches = m.parse(a.datum)
        puts matches if matches && !matches.empty?
      end
    end

    def to_s
      name
    end
  end
end
