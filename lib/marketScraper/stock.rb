require 'pry'

class Stock
    attr_accessor :name, :shares, :value, :bid, :ask
    attr_reader :symbol

    @@all = []

    def initialize (name, symbol, shares = 1)
        @name = name
        @shares = shares
        self.get_info

        save
    end

    def symbol
        @symbol.dup.freeze
    end

    # def get_info
    #     scraper = Scraper.new(self.symbol)
       
    #     @value = scraper.value
    #     @bid = scraper.bid
    #     @ask = scraper.ask
    # end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def info
        Puts "Here is the ifo for #{stock.name}"
        puts self.shares
        puts self.value
    end

    def total_value 
        binding.pry
        total = self.value * self.shares
        total.to_i
    end 

    def get_info
        browser = Watir::Browser.new :chrome
        browser.goto("https://finance.yahoo.com/quote/#{symbol}")
        # @doc = Nokogiri::HTML(open("https://finance.yahoo.com/quote/#{symbol}"))
        binding.pry
        @value = doc.search()
        @bid = 200
        @ask = 300
    end    
end
