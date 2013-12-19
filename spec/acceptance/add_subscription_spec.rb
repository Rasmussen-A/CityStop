require 'spec_helper'

feature 'Subscribe to itinerary' do

  let(:mike) { FactoryGirl.create :user, name: 'Mike', email: 'mike@yahoo.com' }
  let(:bob) { FactoryGirl.create :user, name: 'Bob' }

  before do
    mike.itineraries.create(FactoryGirl.attributes_for(:itinerary, user: mike))
    @trip = mike.itineraries.find_by_name(I18n.t :factory_itinerary_name)
  end

  scenario 'should not be able to add creator to subscriptions' do
    login_user(mike)
    visit itineraries_public_path
    page.should have_content(mike.name)
    expect{ click_link(@trip.name) }.to_not change{ @trip.count }.by(-1)
    page.should_not have_content(I18n.t :fit_in)
  end

  scenario 'should be able to add another user to subscriptions' do
    login_user(bob)
    visit itineraries_public_path
    page.should have_content(bob.name)
    click_link(@trip.name)
    expect{ click_link(I18n.t :fit_in) }.to change{ @trip.count }.by(-1)
    current_path.should == itinerary_path(@trip)
    page.should have_content(bob.name)
  end

end