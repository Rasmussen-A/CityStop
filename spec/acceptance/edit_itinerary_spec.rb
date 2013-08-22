require "spec_helper"

feature 'Select itinerary', %q{
  As registered user
  I want to select an itinerary
} do

  background do
    @bob = FactoryGirl.create(:user)
    @bob_way = FactoryGirl.create(:itinerary, user: @bob)
    login_user @bob
  end

  scenario 'Select itinerary' do
    visit itineraries_path
    page.should have_selector('a', text: @bob_way.name)
    click_link @bob_way.name
    # Form fields shall be filled
    # by selected itinerary data
    find_field('itinerary[name]').value.should eq @bob_way.name
    find_field('itinerary[description]'
      ).value.should eq @bob_way.description
  end

end # feature Select itinerary

feature 'Edit itinerary', %q{
  As registered user
  I want to edit a selected itinerary
} do

  background do
    @bob = FactoryGirl.create(:user)
    @bob_way = FactoryGirl.create(:itinerary, user: @bob)
    login_user @bob
    click_link @bob_way.name
  end

  scenario 'Edit event' do
    fill_in I18n.t(:itinerary_name_field), with: 'Just edited'
    click_button I18n.t(:update)
    page.should have_selector('a', text: 'Just edited')
  end

end
