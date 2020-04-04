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
        puts ""
        puts "Here is the info for #{self.name}:"
        puts ""
        puts "You have #{self.shares} shares in your portfolio."
        puts ""
        puts "Each share is valued at #{self.value} per share."
        puts " "
        puts "The total value is #{self.total_value}."
        puts ""
        puts "On #{self.date} there was the following data:"
        puts ""
        puts "      Open:   #{self.start}"
        puts "      High:   #{self.high}"
        puts "       Low:   #{self.low}"
        puts "     Close:   #{self.value}"
        puts "    Volume:   #{self.volume}"
    end

    def total_value 
        total = self.value.to_f * self.shares.to_f
        total
    end 

    def get_info
        doc = Nokogiri::HTML(open("http://eoddata.com/stockquote/NYSE/#{self.symbol}.htm"))

        @date = doc.css("table.quotes tr:nth-child(2) > td:nth-child(1)").first.text.strip
        @start =doc.css("table.quotes tr:nth-child(2) > td:nth-child(2)").first.text.strip
        @high =doc.css("table.quotes tr:nth-child(2) > td:nth-child(3)").first.text.strip
        @low = doc.css("table.quotes tr:nth-child(2) > td:nth-child(4)").first.text.strip
        @value = doc.css("table.quotes tr:nth-child(2) > td:nth-child(5)").first.text.strip
        @volume = doc.css("table.quotes tr:nth-child(2) > td:nth-child(6)").first.text.strip
    end    
end
