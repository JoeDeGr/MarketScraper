#CLI controler

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
        while input != 5
            # puts <<-DOC.gsub /^\s*/,''
            puts ""
            puts "You are currently viewing:"
            puts ""
            puts "Portfolio Name:  #{portfolio.name}"
            puts ""
            puts "Portfolio Total Value: #{portfolio.value}"
            puts ""
            puts "How may we assist today?"
            puts "1) Create a new Portfolio"
            puts "2) Review a specific Stock in this Portfolio"
            puts "3) Add a new Stock to this Portfolio"
            puts "4) Switch Portfolios"
            puts "5) Exit"
            # DOC
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
end