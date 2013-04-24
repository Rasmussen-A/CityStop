require 'spec_helper'

describe Itinerary do

  it 'should belong to user' do
    itinerary = FactoryGirl.build(:itinerary, user: nil)
      itinerary.valid?.should be_false
    itinerary.errors[:user].should include(
      I18n.t 'errors.messages.blank')
    itinerary.user = User.new
      itinerary.valid?.should be_true
  end

  it 'should require a name' do
    itinerary = FactoryGirl.build(:itinerary, name: nil)
      itinerary.valid?.should be_false
    itinerary.errors[:name].should include(
      I18n.t 'errors.messages.blank')
    itinerary.name = I18n.t :other_description
      itinerary.valid?.should be_true
  end

  it 'should have a time of occurence' do
    itinerary = FactoryGirl.build(:itinerary, time: nil)
      itinerary.valid?.should be_false
    dt = Time.now
    itinerary.time = dt
      itinerary.valid?.should be_true
      itinerary.time.should == dt
      #itinerary.time.to_s.should == dt.to_s
  end

  it 'should have a coordinates or path' do
    # In progress, db was MIGRATED
  end

end # describe
