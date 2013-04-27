require 'spec_helper'

describe Itinerary do

  before(:each) do
    @route = FactoryGirl.build(:itinerary)
  end

    describe 'initerary info' do

      it 'should belong to user' do
        @route.user = nil
          @route.valid?.should be_false
        @route.errors[:user].should include(
          I18n.t 'errors.messages.blank')
        @route.user = User.new
          @route.valid?.should be_true
      end

      it 'should require a name' do
        @route.name = nil
          @route.valid?.should be_false
        @route.errors[:name].should include(
          I18n.t 'errors.messages.blank')
        @route.name = I18n.t :other_description
          @route.valid?.should be_true
      end

      it 'should have a time of occurence' do
        @route.time = nil
          @route.valid?.should be_false
        dt = Time.now
        @route.time = dt
          @route.valid?.should be_true
          @route.time.should == dt
          #@route.time.to_s.should == dt.to_s
      end

    end # describe itinerary info

    describe 'itinerary geo' do

      it 'should have a coordinates or path' do
        # Oh, looks stupid
        @route.route = nil
          @route.valid?.should be_false
        @route.route = [50.24, 84.21, 6.32, 11.84]
          @route.valid?.should be_true
      end

      it 'should have a type' do
        @route.kind = nil
          @route.valid?.should be_false
        @route.kind = 'cycle'
          @route.valid?.should be_true
      end

      it 'pedestrian can have only one geopoint' do
        @route.kind = 'pedestrian'
        # Itinerary factory contain 4 points
          @route.route.length.should == 4
          @route.valid?.should be_false
          @route.errors[:route].should include(
            'pedestrians can have only one geopoint')
        @route.route = [24.04, 11.01]
          @route.route.length.should == 2
          @route.valid?.should be_true
      end

      it 'route points should be even' do
        @route.route = [12.36, 34.12, 43.34]
          @route.valid?.should be_false
          @route.errors[:route].should include(
            "can't be odd")
      end

      it 'route array elements should be float' do
        @route.route = ['string', 64, 55.22, :sym]
          @route.valid?.should be_false
          @route.errors[:route].should include(
            'points can only be float')
      end

      it 'non-pedestrian kindes should contain at least two points' do
        @route.route = [22.22, 54.34]
        @route.kind = 'cycle'
          @route.valid?.should be_false
          @route.errors[:route].should include(
            'non-pedestrian kind must have at least two points')
        @route.kind = 'vechicular'
          @route.valid?.should be_false
          @route.errors[:route].should include(
            'non-pedestrian kind must have at least two points')
        @route.kind = 'pedestrian'
          @route.valid?.should be_true
      end

    end # describe itinerary geo

end # describe Itinerary
