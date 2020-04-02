class Portfolio
    attr_accessor :name, :value
    attr_reader :stocks
    
    @@all = []

    def initialize(name)
        @name = name
        @stocks = []
        @value = 0
        save
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
        stock = stock = Stock.new(name, value, shares)
        self.add_stock(stock)
    end
        
    def review_stocks
        if self.stocks.empty?
            puts "You need to add a stock, silly!"
            self.add_stock_by_name
        else
            self.stocks.each {|s| puts s.name}
            puts "which stock would you like to review?"
            input = gets.chomp
           self.stocks.find{|i| i.name == input}.info
        end
    end

    def add_stock(stock)
        if !stock.is_a?(Stock)
            raise InvalidType, "Invalid stock type, stock must be a Stock!"
        else
            @stocks << stock
            @value += stock.total_value
        end
    end

    def stock
        @stock.dup.freeze
    end


    def self.create
        puts "What would you like to call your new portfolio?"
        input = gets.chomp
        portfolio = self.new(input)
    end

    def self.switch
        if self.all.empty?
            puts "You need to add a portfolio, silly!"
            self.create
        else
            self.all.each {|p| puts p.name}
            puts "which portfolio would you like to review?"
            input = gets.chomp
            self.all.find{|i| i.name == input}
        end
    end



end
