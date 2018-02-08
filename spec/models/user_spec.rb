require 'rails_helper'

describe 'User' do
  it 'can be admin' do
    user = User.new(
      email: 'an@email.com',
      password: '12345678',
      admin: true
    )

    user.save

    expect(user.admin?).to eq(true)
    expect(user).to be_admin
  end

  
end
