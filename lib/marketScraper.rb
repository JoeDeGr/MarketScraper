require 'open-uri'
require 'pry'
require 'nokogiri'
require_relative "./marketScraper/version"
require_relative './marketScraper/cli'
require_relative './marketScraper/portfolio'
require_relative './marketScraper/stock'
require_relative './marketScraper/scraper'

module MarketScraper

  class Error < StandardError; end
  
  class InvalidType < StandardError; end

end