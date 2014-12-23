module Ubi
  class Datum
    def initialize(data)
      @data = data
    end

    def read_chunk(regex)
      data.match(regex)
    end

    def read_list(list, args = [])
      s = struct_for(args)
      data.xpath(list).map { |i| s.new(*i.xpath()) }
    end

    def read_table(table, args = [], subs = '')
      s = struct_for(*args)
      data.xpath(table).map do |r|
        s.new(*r.xpath('td/text()').map { |t| t.to_s.gsub(subs, '').strip.chomp })
      end
    end

    private

    def struct_for *keys
      @struct = Struct.new(*keys)
    end
  end
end
