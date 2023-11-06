require './lib/item'

class FoodTruck
    attr_reader :name, :inventory

    def initialize(name)
        @inventory = {}
        @name = name
    end

    def check_stock(item)
        if @inventory.has_key?(item) == false
            return 0
        else
            return @inventory[item]
        end
    end

    def stock(item, num)
        if @inventory.has_key?(item) == false
            @inventory[item] = num
        else
            @inventory[item] += num
        end
    end
end