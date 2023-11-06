require "./lib/item"
require "./lib/food_truck"
require "./lib/event"

describe Event do
    it "exists" do
        event = Event.new("South Pearl Street Farmers Market")

        expect(event).to be_a Event
    end

    it "stores and reads a name, and creates default empty food_trucks array" do
        event = Event.new("South Pearl Street Farmers Market")
        food_truck1 = FoodTruck.new("Rocky Mountain Pies")

        expect(event.name).to eq("South Pearl Street Farmers Market")
        expect(event.food_trucks).to eq([])
    end

    it "adds a food truck" do
        event = Event.new("South Pearl Street Farmers Market")
        food_truck1 = FoodTruck.new("Rocky Mountain Pies")
        food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")

        event.add_food_truck(food_truck1)
        event.add_food_truck(food_truck2)

        expect(event.food_trucks).to include(food_truck1, food_truck2)
    end    
end