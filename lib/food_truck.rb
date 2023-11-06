class FoodTruck
    attr_reader :name, :inventory
    
    def initialize(name)
        @name = name
        @inventory = {}
    end

    def check_stock(item)
        @inventory[item] ? @inventory[item] : 0
    end

    def stock(item, count)
        current_stock = check_stock(item)
        current_stock += count
        @inventory[item] = current_stock
    end
end