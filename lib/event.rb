require './lib/food_truck'
require './lib/item'

class Event
    attr_reader :name, :food_trucks

    def initialize(name)
        @name = name
        @food_trucks = []
    end

    def add_food_truck(truck)
        @food_trucks.append(truck)
    end

    def food_trucks_names
        names = []
        @food_trucks.each do |truck|
            names.append(truck.name)
        end
        names
    end

    def food_trucks_that_sell(item)
        selling_trucks = []
        @food_trucks.each do |truck|
            if truck.check_stock(item) > 0
                selling_trucks.append(truck)
            end
        end
        selling_trucks
    end

    def sorted_item_list
        list = []
        @food_trucks.each do |truck|
            truck.inventory.each do |item, stock|
                if list.include?(item.name) == false
                    list.append(item.name)
                end
            end
        end
        list.sort
    end

    def total_inventory
        ti = {}
        @food_trucks.each do |truck|
            truck.inventory.each do |item, stock|
                if ti.has_key?(item) == false
                    ti[item] = {"quantity" => stock, "food_trucks" => [truck]}
                else
                    ti[item]["quantity"] += stock
                    ti[item]["food_trucks"].append(truck)
                end
            end
        end
        ti
    end
end