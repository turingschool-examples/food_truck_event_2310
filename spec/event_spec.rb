require "spec_helper"

RSpec.describe Event do
  it 'exists' do
    event = Event.new("South Pearl Street Farmers Market")  
    expect(event).to be_a Event
  end

  it 'has a name' do
    event = Event.new("South Pearl Street Farmers Market") 
    expect(event.name).to eq("South Pearl Street Farmers Market")

    expect(event.food_trucks).to eq([])

  end

  it "has a food truck names and potential revenue methods" do
    event = Event.new("South Pearl Street Farmers Market") 
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})

    food_truck1 = FoodTruck.new("Rocky Mountain Pies")
    food_truck1.stock(item1, 35)
    food_truck1.stock(item2, 7)

    food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
    food_truck2.stock(item4, 50)
    food_truck2.stock(item3, 25)

    food_truck3 = FoodTruck.new("Palisade Peach Shack")
    food_truck3.stock(item1, 65)

    event.add_food_truck(food_truck1)
    event.add_food_truck(food_truck2) 
    event.add_food_truck(food_truck3)

    event.food_trucks

    expect(event.food_truck_names).to eq(["Rocky Mountain Pies", "Ba-Nom-a-Nom", "Palisade Peach Shack"])
    expect(event.food_trucks_that_sell(item1)).to eq([food_truck1, food_truck3])
    expect(food_truck1.potential_revenue).to eq(148.75)
    expect(food_truck2.potential_revenue).to eq(345.00)
    expect(food_truck3.potential_revenue).to eq(243.75)

  end

    it "has a sorted_item_list method" do
      event = Event.new("South Pearl Street Farmers Market") 
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})

    food_truck1 = FoodTruck.new("Rocky Mountain Pies")
    food_truck1.stock(item1, 35)
    food_truck1.stock(item2, 7)

    food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
    food_truck2.stock(item4, 50)
    food_truck2.stock(item3, 25)

    food_truck3 = FoodTruck.new("Palisade Peach Shack")
    food_truck3.stock(item1, 65)

    event.add_food_truck(food_truck1)
    event.add_food_truck(food_truck2) 
    event.add_food_truck(food_truck3)

    event.food_trucks
      expect(event.sorted_item_list).to eq(["Apple Pie (Slice)", "Banana Nice Cream", "Peach Pie (Slice)", "Peach-Raspberry Nice Cream"])
    end

    it "has a total inventory method" do
      event = Event.new("South Pearl Street Farmers Market") 
      peach = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
      apple = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
      rasp = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
      banana = Item.new({name: "Banana Nice Cream", price: "$4.25"})
  
      food_truck1 = FoodTruck.new("Rocky Mountain Pies")
      food_truck1.stock(peach, 35)
      food_truck1.stock(apple, 7)
  
      food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
      food_truck2.stock(banana, 50)
      food_truck2.stock(rasp, 25)
  
      food_truck3 = FoodTruck.new("Palisade Peach Shack")
      food_truck3.stock(peach, 65)
  
      event.add_food_truck(food_truck1)
      event.add_food_truck(food_truck2) 
      event.add_food_truck(food_truck3)
      

      expect(event.total_inventory).to be_a Hash
      expect(event.total_inventory[peach][:quantity]).to eq(100)
      expect(event.total_inventory[apple][:quantity]).to eq(7)
      expect(event.total_inventory[rasp][:quantity]).to eq(25)

      expect(event.total_inventory[peach][:food_trucks]).to eq(["Rocky Mountain Pies", "Palisade Peach Shack"])
      expect(event.total_inventory[apple][:food_trucks]).to eq(["Rocky Mountain Pies"])
      expect(event.total_inventory[rasp][:food_trucks]).to eq(["Ba-Nom-a-Nom"])

    end

    it "has a overstocked items method" do
      event = Event.new("South Pearl Street Farmers Market") 
      peach = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
      apple = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
      rasp = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
      banana = Item.new({name: "Banana Nice Cream", price: "$4.25"})
  
      food_truck1 = FoodTruck.new("Rocky Mountain Pies")
      food_truck1.stock(peach, 35)
      food_truck1.stock(apple, 7)
  
      food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
      food_truck2.stock(banana, 50)
      food_truck2.stock(rasp, 25)
  
      food_truck3 = FoodTruck.new("Palisade Peach Shack")
      food_truck3.stock(peach, 65)
  
      event.add_food_truck(food_truck1)
      event.add_food_truck(food_truck2) 
      event.add_food_truck(food_truck3)

      expect(event.overstocked_items).to eq([peach])

      
    end

  end