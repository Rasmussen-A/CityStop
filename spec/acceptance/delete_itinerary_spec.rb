require 'spec_helper'

feature 'Delete itinerary', %q{
  As signed in user
  I want to remove some itineraries
} do

  background do
    # Selenium driver gives js executing ability
    Capybara.current_driver = :selenium
    @bob = FactoryGirl.create(:user)
    @bob_way = FactoryGirl.create(:itinerary, user: @bob,
      name: 'Zombie itinerary')
    login_user(@bob)
  end

  after do
    # Rolling back to defaults after test passing
    Capybara.use_default_driver
  end

  scenario 'Remove itinerary' do
    page.should have_content('Zombie itinerary')
    page.source.should have_selector(
       "form[action='/itineraries/#{@bob_way.id}'] input[value='delete']")
    # form.should have_selector("input[value='delete']")
    # Autoconfirm dialog
    # That is why I use selenium driver
    page.execute_script(
      'window.confirm = function() {return true;}')
    click_button 'X'
    page.should_not have_content('Zombie itinerary')
  end

end
