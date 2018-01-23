require 'rails_helper'
require 'capybara'

describe 'Kata' do

  it 'can be read(two katas)' do
    kata_title = 'second title'
    kata_description = 'second description'

    create_kata
    create_kata(title: kata_title, description: kata_description)

    visit root_path
    click_on(kata_title)

    expect(page).to have_content(kata_title)
    expect(page).to have_content(kata_description)
  end

  it 'can be created' do
    kata_title = 'second title'
    kata_description = 'second description'

    visit root_path
    click_on('New Kata')
    fill_in(:title, with: kata_title)
    fill_in(:description, with: kata_description)
    click_on('Save')

    expect(page).to have_content(kata_title)
    expect(page).to have_content(kata_description)

  end

  def create_kata(title: 'kata title', description: 'kata description')
    kata = Kata.new(title: title, description: description)
    kata.save

    kata
  end
end
