module Ubi
  #
  # Thema -> subject, matter, case
  #
  class Thema
    include ActiveModel::AttributeMethods
    include ActiveModel::Serialization
    include ActiveModel::Dirty

    attr_accessor :name

    def initialize(name, type = :omni, opts = {})
      @name = name
      @type = type
      @cache = Ubi.memorias.reduce({}) { |a, e| a.merge(e => opts[e]) }
    end

    Ubi.memorias.each do |memoria|
      define_method memoria.key do
        memoria
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

    def try_aranea(a)
      Ubi.memorias.each do |m|
        @cache[m] = m.parse(a)
      end
    end

    def to_s
      name
    end

  end
end
