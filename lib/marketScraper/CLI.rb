#CLI controler

class MarketScraper::CLI

    def call

        puts "Your Portfolio now:"

        portfolio_value

        portfolio_stocks

        menu_init

        
    end

    def portfolio_value

        puts "One Million Dollars!"
    end

    def portfolio_stocks

        puts <<-DOC
        
        You got the best Stocks!

            ABC 100 
            DEF 100
            GHI 100
        3
        DOC
    end

    def menu_init
        puts "How may we further assist today"
        puts <<-DOC.gsub /^\s*/,''
        1) Review a specific stock in a portfolio
        2) Create a new Portfolio
        3) Add a new Stock to a portfolio
        4) exit
        DOC
        input = gets.chomp.to_i

        case input
        when 1
            menu_stock
        when 2
            new_portfolio
        when 3
            add_stock_by_name
        when 4
            exit
        end
    end

    def menu_stock
        Stock.all.each {|s| puts s.name}
        puts "which stock would you like to review?"
        input = gets.chomp
        puts Stock.all.input.info
    end

    def new_portfolio
        puts "What would you like the name of the new portfolio to be?"
        input = gets.chomp
        name = input
        Portfolio.new(name)
        
    end

    def add_stock_by_name
        name = ""
        value= 0
        shares = 1
        puts "What is the name of your new stock?"
        input = gets.chomp
        name = input
        puts "How many shares do you have?"
        input = gets.chomp.to_i
        shares = input
        Portfolio.add_stock(name, value, shares)

    end


        
     






end