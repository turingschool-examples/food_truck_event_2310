require './lib/item'
require './lib/food_truck'
require './lib/event'

RSpec.describe Event do

  before(:each) do
    @event = Event.new("South Pearl Street Farmers Market")
  end
  
  it 'exists' do
    expect(@event).to be_an_instance_of(Event)
  end
  
  it 'has a name' do
    expect(@event.name).to eq("South Pearl Street Farmers Market")
  end
  
  it 'has no food trucks' do
    expect(@event.food_trucks).to eq([])
  end
  
  it 'can add a food truck' do
    @food_truck1 = FoodTruck.new("Rocky Mountain Pies")
    @event.add_food_truck(@food_truck1)

    expect(@event.food_trucks).to eq([@food_truck1])
  end

end