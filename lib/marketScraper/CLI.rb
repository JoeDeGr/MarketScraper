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
        while input != 7
            
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
            puts "5) Clear all stocks in this Portfolio."
            puts "6) YARRRGH!"
            puts "7) Exit"

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
            when 5
                portfolio.clear_portfolio
            when 6
                
                portfolio.clear_portfolio
                sleep(5)
                puts ""
                puts "Your Stock..."
                sleep(4)
                puts "...They're all gone!"
                puts ""
                puts "...<weeping>..."
                sleep(3)
                puts ""
                puts "I am sad."
                puts ""
                sleep(2)
                puts "LOOK WHAT YOU'VE DONE!!!!"
                puts ""
                puts "Portfolio Name:  #{portfolio.name}"
                puts ""
                puts "Portfolio Total Value: #{portfolio.value}"
                puts ""
                sleep(6)
                puts "... Wait... WHAT'S THAT!!!!!"
                sleep(6)
                puts "YAAAAAAAAARRRRRRRGH!!!!"
                sleep(5)
                puts "...<silence>..."
                sleep(5)
                puts ""
                Portfolio.yaargh!
                Stock.yaargh!
                portfolio.name = ""
                puts "You are currently viewing:"
                puts ""
                puts "Portfolio Name:  #{portfolio.name}"
                puts ""
                puts "Portfolio Total Value: #{portfolio.value}"
                puts ""
                portfolio = Portfolio.create
            end    
        end
        leave
    end

    def leave
        puts "Goodbye!"
        exit
    end
end