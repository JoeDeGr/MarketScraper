#CLI controler

require 'pry'

class MarketScraper::CLI
    attr_accessor :portfolio

    def call

        @portfolio = ""

        menu_init

    end

    def menu_init
        input = ""

        while Portfolio.all.empty?
            portfolio = Portfolio.create
  
        end 
            # menu_2
        while input != 5
            puts <<-DOC.gsub /^\s*/,''
            You are currently viewing:
            Portfolio name:  #{portfolio.name}
            Portfolio value: #{portfolio.value}

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

    def new_portfolio
        puts "What would you like the name of the new portfolio to be?"
        input = gets.chomp
        name = input
        Portfolio.new(name)
        menu_2
    end

    def leave
        puts "Goodbye!"
        exit
    end

    # def menu_2
    #   input = ""
    #     while input != 5
    #         puts <<-DOC.gsub /^\s*/,''
    #         You are currently viewing:
    #         Portfolio #{portfolio.name}

    #         How may we assist today?
    #         1) Create a new Portfolio
    #         2) Review a specific Stock in this Portfolio
    #         3) Add a new Stock to this Portfolio
    #         4) Switch Portfolios
    #         5) Exit
    #         DOC
    #         input = gets.chomp.to_i
    #         case input
            
    #         when 1
    #             portfolio = Portfolio.create
    #         when 2
    #             portfolio.review_stocks    
    #         when 3
    #             portfolio.add_stock_by_name
    #         when 4
    #             portfolio = Portfolio.switch
    #         end    
    #     end
    #     leave
    # end
end