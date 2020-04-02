class Scraper

    def initialize(symbol)
        @doc = Nokogiri::HTML(open("https://finance.yahoo.com/quote/#{symbol}"))
    end
end
