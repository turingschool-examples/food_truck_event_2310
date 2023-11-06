require './lib/item'

RSpec.describe Item do

  before(:each) do
    @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
  end

  it 'exists' do
  expect(@item2).to be_an_instance_of(Item)
  end
  
  it 'has name' do
  expect(@item2.name).to eq('Apple Pie (Slice)')
  end
  
  it 'has price' do
  expect(@item2.price).to eq(2.50)
  end

end