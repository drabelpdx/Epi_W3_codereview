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
