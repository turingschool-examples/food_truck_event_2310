require './lib/food_truck'
require './lib/item'
require './lib/event'

RSpec.describe Event do
    it "can make new event" do
        event = Event.new("South Pearl Street Farmers Market")

        expect(event.name).to eq("South Pearl Street Farmers Market")
        expect(event.food_trucks).to eq([])
    end

    it "can add food truck" do
        event = Event.new("South Pearl Street Farmers Market")
        food_truck1 = FoodTruck.new("Rocky Mountain Pies")
        event.add_food_truck(food_truck1)

        expect(event.food_trucks).to eq([food_truck1])
        expect(event.food_trucks_names).to eq([food_truck1.name])
    end

    it "food trucks that sell" do
        event = Event.new("South Pearl Street Farmers Market")
        item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3"})
        item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
        food_truck1 = FoodTruck.new("Rocky Mountain Pies")
        food_truck1.stock(item1, 30)
        event.add_food_truck(food_truck1)

        expect(event.food_trucks_that_sell(item1)).to eq([food_truck1])
        expect(event.food_trucks_that_sell(item2)).to eq([])
    end
end