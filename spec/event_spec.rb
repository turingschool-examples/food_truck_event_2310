require './lib/item'
require './lib/food_truck'
require './lib/event'
require 'pry'

RSpec.describe Event do
  before :each do
    @event = Event.new("South Pearl Street Farmers Market")
      
    @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
  
    @food_truck1 = FoodTruck.new("Rocky Mountain Pies")
    @food_truck1.stock(@item1, 35) 
    @food_truck1.stock(@item2, 7)  
  
    @food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")  
    @food_truck2.stock(@item4, 50)    
    @food_truck2.stock(@item3, 25)
  
    @food_truck3 = FoodTruck.new("Palisade Peach Shack") 
    @food_truck3.stock(@item1, 65) 
  
    @event.add_food_truck(@food_truck1) 
    @event.add_food_truck(@food_truck2) 
    @event.add_food_truck(@food_truck3)
  end

  it 'can intialize' do

    expect(@event).to be_an_instance_of(Event)
  end

  it 'has a name' do
    
    expect(@event.name).to eq("South Pearl Street Farmers Market")
  end

  it 'can add food trucks' do

    expect(@event.food_trucks).to include(@food_truck1, @food_truck2, @food_truck3)
  end

  it 'can list food truck names' do
    expect(@event.food_truck_names).to include("Rocky Mountain Pies")
    expect(@event.food_truck_names).to include("Ba-Nom-a-Nom")
    expect(@event.food_truck_names).to include("Palisade Peach Shack")
  end

  it 'can find food trucks at the event that sell specific items' do
    expect(@event.food_trucks_that_sell(@item1)).to include(@food_truck1, @food_truck3)
    expect(@event.food_trucks_that_sell(@item4)).to include(@food_truck2)
  end

  it 'can calculate potential revenue for each food truck' do
    expect(@food_truck1.potential_revenue).to eq(148.75)
    expect(@food_truck2.potential_revenue).to eq(345.00)
    expect(@food_truck3.potential_revenue).to eq(243.75)
  end

  it 'can create a sorted item list' do

    expect(@event.sorted_item_list).to eq(["Apple Pie (Slice)", "Banana Nice Cream", "Peach Pie (Slice)", "Peach-Raspberry Nice Cream"])
  end

  it 'returns total inventory as specified' do
    total_inventory = @event.total_inventory

    expect(total_inventory).to be_a Hash
    expect(total_inventory[@item1]).to be_a Hash
    expect(total_inventory[@item1][:quantity]).to eq(100)
    expect(total_inventory[@item1][:food_trucks]).to include(@food_truck1, @food_truck3)
    expect(total_inventory[@item2][:quantity]).to eq(7)
    expect(total_inventory[@item2][:food_trucks]).to include(@food_truck1)
    expect(total_inventory[@item3][:quantity]).to eq(25)
    expect(total_inventory[@item3][:food_trucks]).to include(@food_truck2)
    expect(total_inventory[@item4][:quantity]).to eq(50)
    expect(total_inventory[@item4][:food_trucks]).to include(@food_truck2)
  end

  it 'can generate a list of overstocked items' do
    expect(@event.overstocked_items).to include(@item1)
    expect(@event.overstocked_items).not_to include(@item2)
    expect(@event.overstocked_items).not_to include(@item3)
    expect(@event.overstocked_items).not_to include(@item4)
  end
end