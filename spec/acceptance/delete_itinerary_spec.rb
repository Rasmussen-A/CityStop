require 'spec_helper'

feature 'Delete itinerary', %q{
  As signed in user
  I want to remove some itineraries
} do

  background do
    # Selenium driver gives forms autoconfirm ability
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
    # Input with 'delete' value should
    # call http DELETE method - this
    # only way known (by me) way to delete exiting
    # itinerary using form and keeping RESTful
    page.should have_selector(
      "form[action='/itineraries/#{@bob_way.id}'] input[value='delete']")
    # Autoconfirm dialog
    page.execute_script(
      'window.confirm = function() {return true;}')
    click_button 'X'
    page.should_not have_content('Zombie itinerary')
  end

end
