module Ubi
  # Suppose to be html reader
  class Datum
    attr_accessor :data, :words, :links

    def initialize(data, words, links)
      # binding.pry
      @data = data
      @words = data.xpath(words).text
      @links = data.xpath(links).map { |a| a.values.join(' ') }
    end

    def xpath(path)
      data.xpath(path)
    end

    def read_div(div)
      data.xpath("//#{div}").text
    end

    def read_list(list, args = [])
      s = struct_for(args)
      data.xpath(list).map { |i| s.new(*i.xpath) }
    end

    def read_table(table, args = [], subs = '')
      s = struct_for(*args)
      data.xpath(table).map do |r|
        s.new(*r.xpath('td/text()').map { |t| t.to_s.gsub(subs, '').strip.chomp })
      end
    end

    private

    def struct_for(*keys)
      @struct = Struct.new(*keys)
    end
  end
end
