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

describe('the edit Stylist path', {:type => :feature}) do
  it('allows user to change the name of a stylist') do
    visit('/stylists')
    fill_in('name', :with => 'Marc')
    click_button('Add Stylist')
    click_link('Marc')
    fill_in('name', :with => 'Mark')
    click_button('Edit Name')
    expect(page).to have_content('Mark')
  end
end

describe('the edit Client path', {:type => :feature}) do
  it('allows user to change the name of a client') do
    visit('/clients')
    fill_in('name', :with => 'Sally')
    click_button('Add Client')
    click_link('Sally')
    fill_in('name', :with => 'Tom')
    click_button('Edit Name')
    expect(page).to have_content('Tom')
  end
end

# describe('the delete Stylist path', {:type => :feature}) do
#   it('allows user to remove a stylist') do
#     visit('/stylists/:id')
#     fill_in('name', :with => 'Marc')
#     click_button('Delete Stylist')
#     expect(page).to have_content('Marc')
#   end
# end
