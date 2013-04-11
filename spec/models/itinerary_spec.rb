require 'spec_helper'

describe Itinerary do

  it 'should belong to user' do
    itinerary = FactoryGirl.build(:itinerary, user: nil)
    itinerary.valid?.should be_false
    itinerary.errors[:user].should include("can't be blank")
    itinerary.user = User.new
    itinerary.valid?.should be_true
  end

  it 'should require a name' do
    itinerary = FactoryGirl.build(:itinerary, name: nil)
    itinerary.valid?.should be_false
    itinerary.errors[:name].should include("can't be blank")
    itinerary.name = I18n.t :other_description
    itinerary.valid?.should be_true
  end

end # describe
