require './lib/item'

class Food_Truck
    attr_reader :name, :inventory

    def initialize(name)
        @inventory = {}
        @name = name
    end

    
end