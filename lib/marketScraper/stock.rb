require 'pry'


class Stock
    attr_accessor 
    attr_reader :symbol, :name, :shares, :open, :high, :low, :value, :date, :volume

    @@all = []

    def initialize (name, symbol, shares)
        @name = name
        @shares = shares
        @symbol = symbol
        self.get_info

        save
    end

    def symbol
        @symbol.dup.freeze
    end

    def symbol=
        @symbol = symbol
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def info
        Puts "Here is the info for #{self.name}"
        puts self.shares
        puts self.value
    end

    def total_value 
        total = self.value * self.shares
        total.to_i
    end 

    def get_info

        # url = "http://eoddata.com/stockquote/NYSE/.htm"

        # doc = Nokogiri::HTML(open("http://eoddata.com/stockquote/NYSE/#{self.symbol}.htm"))

        # @date = doc.css("table.quotes tr:nth-child(2) > td:nth-child(1)").first.text.strip
        # @open =doc.css("table.quotes tr:nth-child(2) > td:nth-child(2)").first.text.strip
        # @high =doc.css("table.quotes tr:nth-child(2) > td:nth-child(3)").first.text.strip
        # @low = doc.css("table.quotes tr:nth-child(2) > td:nth-child(4)").first.text.strip
        # @value = doc.css("table.quotes tr:nth-child(2) > td:nth-child(5)").first.text.strip
        # @volume = doc.css("table.quotes tr:nth-child(2) > td:nth-child(6)").first.text.strip

        @date = 1
        @open = 2
        @high = 3
        @low = 4
        @value = 5
        @volume =6
    end    
end
