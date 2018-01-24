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


  it 'can be updated' do
      kata_title = 'kata title2'
      kata_description = 'kata description2'

          kata_title2 = 'kata title2'
          kata_description2 = 'kata description2'

      create_kata(title: kata_title, description: kata_description)

      visit root_path
      click_on('Edit Kata')

      fill_in(:kata_title, with: kata_title2)
      fill_in(:kata_description, with: kata_description2)
      click_on('Save')

      expect(page).to have_content(kata_title2)
      expect(page).to have_content(kata_description2)
    end

  def create_kata(title: 'kata title', description: 'kata description')
    kata = Kata.new(title: title, description: description)
    kata.save

    kata
  end

end
