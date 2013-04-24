require 'spec_helper'

feature 'Show itinerary', %q{
  As signed in user
  I want to see an Itinerary
  with details
} do

  background do
    @bob = FactoryGirl.create(:user)
    @bob_way = FactoryGirl.create(:itinerary, user: @bob)
    login_user @bob
  end

  scenario 'Show itinerary' do
    click_link I18n.t :details
    # I suppose that lately itinerary details
    # will render as partial or whathever
    current_path.should == itinerary_path(@bob_way)
    page.should have_content(@bob_way.time)
    page.should have_content(@bob_way.name)
    page.should have_content(@bob_way.description)
  end

end
