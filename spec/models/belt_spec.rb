require 'rails_helper'

describe 'Belt' do
  before(:each) do
    @kata = Kata.new(title:'title', description: 'sdf')
    @kata.save
    @belt = Belt.new(name: 'name', description: 'desc', kata_id: @kata.id)
    @belt.save
  end
  it 'belong to a kata' do

    expect(@belt.kata).to eq(@kata)
    expect(@kata.belts).to eq([@belt])
  end
  it 'retrieves its kata id' do

    retrieved_kata_id = Belt.find_kata_id(@belt.id)

    expect(retrieved_kata_id).to eq(@kata.id)
  end
  it 'retrieves title with description' do
    expect(@belt.inline).to eq("#{@belt.name} - #{@belt.description}")
  end
end
