#coding: utf-8
require 'spec_helper'

describe User do

  describe "the 'name' attribute" do

    before(:each) do
      @user = FactoryGirl.build(:user)
    end

    it "should exist in User model" do
      @user.should respond_to(:name)
      @user.should respond_to(:name=)
    end

    it "should be unique" do
      @user.save
      user2 = FactoryGirl.build(:user, email: 'lol@wut.ru')
      user2.valid?.should be_false
      user2.errors[:name].should include("has already been taken")
    end

    it "should be required" do
      @user.name = nil
      @user.valid?.should be_false
      @user.errors[:name].should include("can't be blank")
    end

  end # describe name

end # describe User


