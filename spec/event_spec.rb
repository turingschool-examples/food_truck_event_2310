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

    it "adds a food truck and populates an array with food truck names" do
        event = Event.new("South Pearl Street Farmers Market")
        food_truck1 = FoodTruck.new("Rocky Mountain Pies")
        food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")

        event.add_food_truck(food_truck1)
        event.add_food_truck(food_truck2)

        expect(event.food_trucks).to include(food_truck1, food_truck2)
        expect(event.food_truck_names).to contain_exactly("Rocky Mountain Pies", "Ba-Nom-a-Nom")
    end

    it "collates food trucks selling a given item, and collates list of all item names sold by all trucks" do
        event = Event.new("South Pearl Street Farmers Market")
        food_truck1 = FoodTruck.new("Rocky Mountain Pies")
        food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
        food_truck3 = FoodTruck.new("Palisade Peach Shack")

        event.add_food_truck(food_truck1)
        event.add_food_truck(food_truck2)
        event.add_food_truck(food_truck3)

        item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
        item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
        item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
        item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})

        food_truck1.stock(item1, 35)
        food_truck1.stock(item2, 7)
        food_truck2.stock(item4, 50)
        food_truck2.stock(item3, 25)
        food_truck3.stock(item1, 65) 

        expect(event.food_trucks_that_sell(item1)).to contain_exactly(food_truck1, food_truck3)
        expect(event.food_trucks_that_sell(item2)).to contain_exactly(food_truck1)
        expect(event.food_trucks_that_sell(item3)).to contain_exactly(food_truck2)

        expect(event.sorted_item_list).to eq([item2.name, item4.name, item1.name, item3.name])
    end
end