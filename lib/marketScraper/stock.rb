require 'pry'

class Stock
    attr_accessor :name, :value, :shares

    @@all = []

    def initialize (name, value, shares = 1)
        @name = name
        @shares = shares
        @value = value
        save
        binding.pry
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def info
        puts self.name
        puts self.shares
        puts self.value
    end
    
end
