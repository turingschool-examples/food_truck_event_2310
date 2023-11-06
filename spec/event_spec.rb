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









  end