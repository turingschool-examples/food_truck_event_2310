require './lib/item'
require './lib/food_truck' 
require './lib/event'
require 'pry'

RSpec.describe Event do
  describe 'initialize' do
    it 'has @name, @food_trucks' do
      @event = Event.new("South Pearl Street Farmers Market")

      expect(@event).to be_an_instance_of(Event)
      expect(@event.name).to eq("South Pearl Street Farmers Market")
      expect(@event.food_trucks).to eq([])
    end
  end

  describe 'adds items to food trucks' do
    it 'Add items to food trucks going to the event' do
      @event = Event.new("South Pearl Street Farmers Market")
      @food_truck1 = FoodTruck.new("Rocky Mountain Pies")
      @food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")    
      @food_truck3 = FoodTruck.new("Palisade Peach Shack")    

      @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
      @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
      @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
      
      @food_truck1.stock(@item1, 35)    
      @food_truck1.stock(@item2, 7)  
      @food_truck2.stock(@item4, 50)    
      @food_truck2.stock(@item3, 25)
      @food_truck3.stock(@item1, 65)  
    end
  end

  describe '#add_food_truck' do
    it 'Adds food truck to the event' do
      @event = Event.new("South Pearl Street Farmers Market")
      @food_truck1 = FoodTruck.new("Rocky Mountain Pies")
      @food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")    
      @food_truck3 = FoodTruck.new("Palisade Peach Shack")    

      expect(@food_trucks).to eq([])

      @event.add_food_truck(food_truck1)    
      @event.add_food_truck(food_truck2)    
      @event.add_food_truck(food_truck3)

      expect(@food_trucks).to eq([@food_truck1, @food_truck2, @food_truck3])
    end
  end

     
end

