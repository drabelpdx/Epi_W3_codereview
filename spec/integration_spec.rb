require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exception, false)

describe('the add Stylist path', {:type => :feature}) do
  it('adds a stylist and returns a list of all Stylists') do
    visit('/stylists')
    fill_in('name', :with => 'Marc')
    click_button('Add Stylist')
    expect(page).to have_content('Marc')
  end
end

describe('the add Client path', {:type => :feature}) do
  it('adds a client and returns a list of all clients') do
    visit('/clients')
    fill_in('name', :with => 'Sally')
    click_button('Add Client')
    expect(page).to have_content('Sally')
  end
end
