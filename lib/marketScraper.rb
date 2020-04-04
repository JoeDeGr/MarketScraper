require 'open-uri'
require 'pry'
require 'nokogiri'
require_relative "./marketScraper/version"
require_relative './marketScraper/CLI'
require_relative './marketScraper/portfolio'
require_relative './marketScraper/stock'

module MarketScraper

  class Error < StandardError; end
  
  class InvalidType < StandardError; end

end