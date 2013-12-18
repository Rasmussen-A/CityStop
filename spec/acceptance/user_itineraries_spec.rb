require 'spec_helper'

feature 'Unauthorized user', %q{ 
  As not signed in user
  I try to see list of itineraries
  on itineraries page
} do

  background do
    @bob = FactoryGirl.create(:user)
  end

  scenario 'User is not signed in' do
    #here I want to be sure that unauthotized user can't
    #view registered user itineraries
    visit user_root_path
    current_path.should == new_user_session_path
  end

end # feature Unathorized user

feature 'Signed in user', %q{ 
  As authorized user
  I want to see list of itineraries
} do

  background do
    @bob = FactoryGirl.create(:user)
    @bob_way = FactoryGirl.create(:itinerary, user: @bob)
    login_user(@bob)
  end

  scenario 'User is signed in' do
    visit itineraries_path
    page.should have_link(I18n.t(:create), href: new_itinerary_path)
    page.should have_content(@bob.name)
    page.should have_content(@bob_way.name)
    page.should have_content(I18n.t(:sign_out_title))
    visit itineraries_public_path
    page.should have_content(@bob_way.name)
  end

end # feature Signed in user
