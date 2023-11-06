class Event
  attr_reader :name,
              :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(food_truck)
    @food_trucks << food_truck
  end

  def food_truck_names
    @food_trucks.map{|food_truck| food_truck.name}
  end

  def food_trucks_that_sell(item)
    @food_trucks.select{|food_truck| food_truck.inventory.include?(item)}
  end

  

  def total_inventory
    total_items = Hash.new
    @food_trucks.each do |food_truck|
      food_truck.inventory do |item, quantity|
    end
  end
end
