require './lib/item'
require './lib/food_truck'
require './lib/event'

class Event
  attr_reader :name,
              :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(truck)
    @food_trucks << truck
  end

  def food_truck_names
    @food_trucks.map do |truck|
      truck.name
    end
  end

  def food_trucks_that_sell(items)
    trucks_that_sell_item = []

    @food_trucks.each do |food_truck|
      if food_truck.inventory.include?(items) 
        trucks_that_sell_item << food_truck
      end
    end
    trucks_that_sell_item
  end
end