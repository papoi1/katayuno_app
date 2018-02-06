require 'rails_helper'

describe 'Belt' do
  it 'belong to a kata' do
    kata = Kata.new(title:'title', description: 'sdf')
    kata.save

    belt = Belt.new(
      name: 'name',
      description: 'desc',
      kata_id: kata.id
    )
    belt.save

    expect(belt.kata).to eq(kata)
    expect(kata.belts).to eq([belt])
  end
end
