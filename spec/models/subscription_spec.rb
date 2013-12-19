require 'spec_helper'

describe Subscription do

  let(:mike) { FactoryGirl.create :user, name: 'Mike', email: 'mike@yahoo.com' }
  let(:bob) { FactoryGirl.create :user, name: 'Bob' }
  let(:trip) { FactoryGirl.create :itinerary, user: mike }
  let(:fit_in) { FactoryGirl.create :subscription, user: bob, itinerary: trip}

  it 'should belong to user' do
    fit_in.valid?.should be_true
    expect{ fit_in.user = nil }.to_not change{ fit_in.user }.from(mike).to(nil)
  end

  it 'should have an itinerary when active' do
    expect{ fit_in.itinerary = nil }.to_not change{ fit_in.itinerary }.from(trip).to(nil)
  end

end
