class Scraper
    attr_accessor :value, :symbol, :bid, :ask


    def initialize(symbol)
        @symbol = symbol

        self.get_info
    end

    def get_info
        @doc = Nokogiri::HTML(open("https://finance.yahoo.com/quote/#{symbol}"))
        @value = 1,000
        @bid = 200
        @ask = 300
    end


end