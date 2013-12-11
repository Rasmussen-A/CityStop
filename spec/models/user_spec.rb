require 'spec_helper'

describe User do

  before(:each) do
    @bob = FactoryGirl.build(:user)
  end

  describe "the 'name' attribute" do

    it 'should exist in User model' do
      @bob.should respond_to(:name)
      @bob.should respond_to(:name=)
    end

    it 'should be unique' do
      @bob.save
      john = FactoryGirl.build(:user, email: 'lol@wut.ru')
      john.valid?.should be_false
      john.errors[:name].should include(
        I18n.t 'errors.messages.taken')
    end

    it 'should be required' do
      @bob.name = nil
      @bob.valid?.should be_false
      @bob.errors[:name].should include(
        I18n.t 'errors.messages.blank')
    end

  end # describe name

  describe 'itineraries' do

    it 'can be created for a user' do
      lambda {
       @bob.itineraries.build(name: I18n.t(:factory_itinerary_description))
      }.should change(@bob.itineraries, :length).by(1)
    end

    it 'can be removed from a user' do
      @bob.itineraries.build(name: I18n.t(:other_description))
      lambda {
       @bob.itineraries.destroy_all
      }.should change(@bob.itineraries, :length).by(-1)
    end

  end # describe itineraries

end # describe User
