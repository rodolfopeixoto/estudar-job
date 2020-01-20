require 'rails_helper'

RSpec.feature 'Users can create new users' do
  before do
    visit '/'
    click_link 'Add New User'
  end

  scenario 'with valid attributes', :vcr do
    fill_in :email, with: 'rodolfog.peixoto@gmail.com'
    fill_in :first_name, with: 'Rodolfo'
    fill_in :last_name, with: 'Peixoto'
    click_button 'Create User'
    expect(page).to have_content 'In the process of creating the user'
  end
end
