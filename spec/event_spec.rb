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

    it "can make list of items names" do
        event = Event.new("South Pearl Street Farmers Market")

        item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3"})
        item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
        item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
        item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})

        food_truck1 = FoodTruck.new("Rocky Mountain Pies")
        food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")  
        food_truck3 = FoodTruck.new("Palisade Peach Shack")

        food_truck1.stock(item1, 35)
        food_truck1.stock(item2, 7)
        food_truck2.stock(item4, 50)
        food_truck2.stock(item3, 25)
        food_truck3.stock(item1, 65)

        event.add_food_truck(food_truck1)
        event.add_food_truck(food_truck2)
        event.add_food_truck(food_truck3)

        expect(event.sorted_item_list).to eq(['Apple Pie (Slice)', "Banana Nice Cream", 'Peach Pie (Slice)', "Peach-Raspberry Nice Cream"])
    end

    it "can make list of items names" do
        event = Event.new("South Pearl Street Farmers Market")

        item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3"})
        item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
        item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
        item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})

        food_truck1 = FoodTruck.new("Rocky Mountain Pies")
        food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")  
        food_truck3 = FoodTruck.new("Palisade Peach Shack")

        food_truck1.stock(item1, 35)
        food_truck1.stock(item2, 7)
        food_truck2.stock(item4, 50)
        food_truck2.stock(item3, 25)
        food_truck3.stock(item1, 65)

        event.add_food_truck(food_truck1)
        event.add_food_truck(food_truck2)
        event.add_food_truck(food_truck3)

        expect(event.total_inventory[item1]).to eq({"quantity" => 100, "food_trucks" => [food_truck1, food_truck3]})
    end
end