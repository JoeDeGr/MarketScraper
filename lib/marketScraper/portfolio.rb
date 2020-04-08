class Portfolio
    attr_accessor :name 
    attr_reader :stocks
    
    @@all = []

    def initialize(name)
        @name = name
        @stocks = []
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
            self.empty
        else
            puts self.stocks
        end
    end

    def add_stock_by_name
        puts "What is the name of your new stock?"
        input = gets.chomp
        name = input

        puts "What is the stock symbol?"
        input = gets.chomp.upcase.to_s
        symbol = input

        puts "Which exchange is the stock traded on?"
        input = gets.chomp.upcase.to_s
        exchange = input

        puts "How many shares do you have?"
        input = gets.chomp.to_i
        shares = input

        stock = Stock.new(name, symbol, shares, exchange)
        self.add_stock(stock)
    end
        
    def review_stocks

        if self.stocks.empty?
            self.empty
        else
            stock = []

            self.stocks.each {|s| stock << s.name}

            input = ""
            until stock.include? (input)
                    self.stocks.each {|s| puts s.name}
                    puts "which stock would you like to review?" 
                    input = gets.chomp.to_s
            end

            self.stocks.find{|i| i.name == input}.info

        end
    end

    def add_stock(stock)

        if !stock.is_a?(Stock)
            raise InvalidType, "Invalid stock type, stock must be a Stock!"
        else
            @stocks << stock
        end
    end

    def value

        value = 0
        
        if self.stocks.empty?
            value
        else
        self.stocks.each do |s| 
            value += s.total_value
            end   
        value
        end
    end
        
    def stock
        @stock.dup.freeze
    end


    def self.create

        names = []

        self.all.each {|p| names << p.name}
        puts "What would you like to call your new portfolio?"
        input = gets.chomp

        if names.include?(input)
            puts "Lets try being origional, shall we?"
            self.create
        else
        portfolio = self.new(input)
        end
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
    
    def empty
        puts "You need to add a stock, silly!"
            self.add_stock_by_name
    end

    def self.yaargh!
        self.all.clear
    end

    def clear_portfolio
        self.stocks.clear
    end

end
