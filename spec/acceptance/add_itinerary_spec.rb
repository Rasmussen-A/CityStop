require 'spec_helper'

feature 'Add itineraries', %q{ 
  As authorized user
  I want to create
  my own itineraries} do

  background do
    @mike = FactoryGirl.create(:user)
    @trip = FactoryGirl.create(:itinerary, user: @mike)
  end

  scenario 'Add basic itinerary' do
    login_user(@mike)
    visit(new_itinerary_path)
    # Filling in itinerary data and saving it
    fill_in I18n.t(:itinerary_name_field),
      with: I18n.t(:factory_itinerary_name)
    # Leave this with default value for a while
    # fill_in I18n.t(:itinerary_time_field),
    #   with: Time.now.to_s
    fill_in I18n.t(:itinerary_description_field),
      with: I18n.t(:other_description)
    click_button I18n.t(:save)
    # Now new itinerary should be displayed in the list
    page.should have_content(I18n.t(:factory_itinerary_name))
    page.should have_content(I18n.t(:other_description))
    page.should have_selector('ul > li')
    # Make sure that we rolled back to itineraries list page
    current_path.should == itineraries_path
    page.should have_content(I18n.t(:my_itineraries))
  end

end # feature Add itineraries
