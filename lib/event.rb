class Event
    attr_reader :name, :food_trucks

    def initialize(name)
        @name = name
        @food_trucks = []
    end

    def add_food_truck(food_truck)
        @food_trucks << food_truck
    end

    def food_truck_names
        @food_trucks.map do |truck|
            truck.name
        end
    end

    def food_trucks_that_sell(item)
        @food_trucks.filter_map do |truck|
            if truck.check_stock(item) > 0
                truck
            end
        end
    end

    def sorted_item_list
        sold_items_hash = {}
        sold_items_array = []
        @food_trucks.each do |truck|
            truck.inventory.each do |item, count|
                sold_items_hash[item] = count
            end
        end
        sold_items_hash.map do |item, count|
            sold_items_array << item.name
        end
        sold_items_array.sort
    end
end