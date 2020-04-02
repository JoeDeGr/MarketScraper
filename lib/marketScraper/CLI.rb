#CLI controler

require 'pry'

class MarketScraper::CLI
    attr_accessor :portfolio

    def call
        @portfolio = ""


        menu_init

        
    end

    def portfolio_value

        portfolio.value

        # puts "One Million Dollars!"
    end

    def portfolio_stocks

        portfolio.stocks

        # puts <<-DOC
        
        # You got the best Stocks!

        #     ABC 100 
        #     DEF 100
        #     GHI 100
        # DOC
    end

    def menu_init
        input = ""

        while Portfolio.all.empty?
            portfolio = Portfolio.create
            # puts "What would you like to call your new portfolio?"
            # input = gets.chomp
            # self.portfolio = Portfolio.new(input)
            
            # puts "Your Portfolio #{portfolio.name}:"

            # self.portfolio.value

            # self.portfolio.stock
            
        end 
            # menu_2
        while input != 5
            puts <<-DOC.gsub /^\s*/,''
            You are currently viewing:
            Portfolio #{portfolio.name}
            How may we assist today?
            1) Create a new Portfolio
            2) Review a specific Stock in this Portfolio
            3) Add a new Stock to this Portfolio
            4) Switch Portfolios
            5) Exit
            DOC
            input = gets.chomp.to_i
            case input
            
            when 1
                portfolio = Portfolio.create
            when 2
                portfolio.review_stocks    
            when 3
                portfolio.add_stock_by_name
            when 4
                portfolio = Portfolio.switch
            end    
        end
        leave
    end

    # def menu_stock
    #     portfolio.stocks.each {|s| puts s.name}
    #     puts "which stock would you like to review?"
    #     input = gets.chomp
    #     puts Stock.all.input.info
    # end

    def new_portfolio
        puts "What would you like the name of the new portfolio to be?"
        input = gets.chomp
        name = input
        Portfolio.new(name)
        menu_2
    end

    # # def add_stock_by_name
    # #     name = ""
    # #     value= 0
    # #     shares = 1
    # #     puts "What is the name of your new stock?"
    # #     input = gets.chomp
    # #     name = input
    # #     puts "How many shares do you have?"
    # #     input = gets.chomp.to_i
    # #     shares = input
    # #     Portfolio.add_stock(name, value, shares)

    # end

    def leave
        puts "Goodbye!"
        exit
    end

    # def menu_2
    #     while input != 4
    #         puts <<-DOC.gsub /^\s*/,''
    #         You are currently viewing:
    #         Portfolio #{self.portfolio.name}
    #         How may we assist today?
    #         1) Review a specific stock in a portfolio
    #         2) Create a new Portfolio
    #         3) Add a new Stock to a portfolio
    #         4) exit
    #         DOC
    #         input = gets.chomp.to_i
    #         case input
    #         when 1
    #             self.portfolio.review_stocks
                
    #         when 2
    #             self.portfolio = Portfolio.create
                
    #         when 3
    #             self. portfolio.add_stock_by_name
    #         end    
    #     end
    #     leave
    # end
end