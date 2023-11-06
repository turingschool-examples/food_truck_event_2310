require './item'
require './food_truck'
require './event'

RSpec.describe Event do
  it 'exists' do
    event = Event.new("South Pearl Street Farmers Market")
  
    expect(event).to be_an_instance_of Event