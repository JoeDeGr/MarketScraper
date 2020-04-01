class Portfolio
    attr_accessor :name, :stocks, :value
    
    @@all = []

    def initialize(name)
        @name = name
        @stocks = []
        @value = 0
        self.name
        save


    end

    def add_stock(name, value, shares)
        puts "Here's what you have done!"
        stock = Stock.new(name, value, shares)
        @stocks << stock

    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end

    def stock
        if self.stocks.empty?
            puts "You need to add a stock, silly!"
            self.add_stock_by_name
            
        else
            puts self.stocks
        end
    end


    def add_stock_by_name
        value= 0
        puts "What is the name of your new stock?"
        input = gets.chomp
        name = input
        puts "How many shares do you have?"
        input = gets.chomp.to_i
        shares = input
        self.add_stock(name, value, shares)
    end
        
    def review_stocks
        portfolio.stocks.each {|s| puts s.name}
        puts "which stock would you like to review?"
        input = gets.chomp
        puts Stock.all.input.info
    end

    def self.create
        puts "What would you like to call your new portfolio?"
        input = gets.chomp
        portfolio = self.new(input)
        
        puts "Your Portfolio #{portfolio.name}:"

        portfolio.stock

       "Portfolio value is: #{portfolio.value}"
    end

end
