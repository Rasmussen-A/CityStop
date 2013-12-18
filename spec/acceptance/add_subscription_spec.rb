require 'spec_helper'

feature 'Subscribe to itinerary' do

  let(:mike) { FactoryGirl.create :user, name: 'Mike', email: 'mike@yahoo.com' }
  let(:bob) { FactoryGirl.create :user, name: 'Bob' }

  before do
    mike.itineraries.create(FactoryGirl.attributes_for(:itinerary))
    @trip = mike.itineraries.find_by_name(I18n.t :factory_itinerary_name)
  end

  scenario 'should add subscription' do
    login_user(bob)
    visit itineraries_public_path
    page.should have_content(bob.name)
    click_link(@trip.name)
    count = @trip.count
    click_link(I18n.t :fit_in)
    current_path.should == itinerary_path(@trip)
    page.should have_content(bob.name)
    count.should == count - 1
  end

end