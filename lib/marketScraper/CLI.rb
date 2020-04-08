#CLI controler

class MarketScraper::CLI
    attr_accessor :portfolio

    def call
        @portfolio = ""
        menu_init
    end

    def menu_init
        
        input = ""

        puts "Hello World!"
        sleep(1)
        puts "Welcome to the market Scraper!"
        sleep(1)

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
                yaargh
                menu_init
            end    
        end
        leave
    end

    def leave
        puts "Goodbye!"
        exit
    end

    def yaargh 
        sleep(5)
        puts ""
        puts "Your Stock..."
        sleep(4)
        puts ""
        puts "...They're all gone!"
        puts ""
        puts "...<weeping>..."
        sleep(3)
        puts ""
         puts "I am sad."
        puts ""
        sleep(2)
        puts "LOOK WHAT YOU'VE DONE!!!!"

        Portfolio.all.each do |p|
            p.clear_portfolio
            puts ""
            puts "Portfolio Name:  #{p.name}"
            puts ""
            puts "Portfolio Total Value: #{p.value}"
            puts ""
            sleep(3)
        end
        
        puts "... Wait... WHAT'S THAT!!!!!"
        sleep(6)
        puts ""
        puts "YAAAAAAAAARRRRRRRGH!!!!"
        sleep(5)
        puts ""
        puts "...<silence>..."
        sleep(5)
        puts ""

        Portfolio.yaargh!
        Stock.yaargh!

        puts "You are currently viewing:"
        puts ""
        puts "THERE ARE NO PORTFOLIOS TO VIEW. PLEASE COME BACK LATER."
        sleep(6)
        puts ""
    end
end