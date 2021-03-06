require 'spec_helper'

feature 'Delete itinerary', %q{
  As signed in user
  I want to remove some itineraries
} do

  background do
    # Selenium driver gives js executing ability
    Capybara.current_driver = :selenium
    @bob = FactoryGirl.create(:user)
    @bob_holiday_trip = FactoryGirl.create(:itinerary, user: @bob,
      name: 'Holiday LA trip')
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
    page.should have_content('Holiday LA trip')
#    # Std driver cannot deal with js code
#    # That is why I used selenium driver
    page.find("a[data-id='#{@bob_way.id}']").click
      click_link(I18n.t :yep)
    current_path.should == itineraries_path
    page.should_not have_content('Zombie itinerary')
    page.should have_content('Holiday LA trip')

    page.find("a[data-id='#{@bob_holiday_trip.id}']").click
      click_link(I18n.t :yep)
    page.should_not have_content('Holiday LA trip')
  end

end
