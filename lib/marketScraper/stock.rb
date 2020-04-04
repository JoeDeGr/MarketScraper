require 'pry'

class Stock
    attr_accessor 
    attr_reader :symbol, :name, :shares, :start, :high, :low, :value, :date, :volume

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
        puts "Here is the info for #{self.name}"
        
        puts "You have #{self.shares} in your portfolio."
        
        puts "Each share is valued at #{self.value} per share."
        
        puts "The total value is #{self.total_value}."
        
        puts "On #{self.date} there was the following data:"
        
        puts "  Open:   #{self.start}"
        puts "  High:   #{self.high}"
        puts "   Low:   #{self.low}"
        puts " Close:   #{self.value}"
        puts "volume:   #{self.volume}"
    end

    def total_value 
        total = self.value.to_f * self.shares.to_f
        binding.pry
        total
    end 

    def get_info

        url = "http://eoddata.com/stockquote/NYSE/.htm"

        doc = Nokogiri::HTML(open("http://eoddata.com/stockquote/NYSE/#{self.symbol}.htm"))

        @date = doc.css("table.quotes tr:nth-child(2) > td:nth-child(1)").first.text.strip
        @start =doc.css("table.quotes tr:nth-child(2) > td:nth-child(2)").first.text.strip
        @high =doc.css("table.quotes tr:nth-child(2) > td:nth-child(3)").first.text.strip
        @low = doc.css("table.quotes tr:nth-child(2) > td:nth-child(4)").first.text.strip
        @value = doc.css("table.quotes tr:nth-child(2) > td:nth-child(5)").first.text.strip
        @volume = doc.css("table.quotes tr:nth-child(2) > td:nth-child(6)").first.text.strip

        # @date = 15
        # @start = 2
        # @high = 3
        # @low = 4
        # @value = 5
        # @volume =6
    end    
end
