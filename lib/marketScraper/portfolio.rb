class Portfolio
    attr_accessor :name, :stocks, :value
    
    @@all =[]

    def initialize(name)
        @name = name
        @stocks = []
        @value = 0
        puts self.name
        puts self.stocks
    end

    def self.add_stock(name, value, shares)
        puts "Here's what you have done!"
        stock = Stock.new(name,value,shares = 1)
        @stocks << stock

    end

end
