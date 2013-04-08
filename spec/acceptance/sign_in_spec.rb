#coding: utf-8
require 'spec_helper'

feature 'Sign in', %q{ As an admin I want to sign in } do

  background do
    click_sign_in
  end

  scenario "Clicking Sign In" do
    page.source.should have_selector("title", text: "CityStop | Вход")
    page.source.should have_selector('form')
  end

  scenario "Successful Sign In" do
    FactoryGirl.create(:user)
    fill_in 'Email', with: 'name@domain.org'
    fill_in 'Password', with: 'password'
    click_on 'Sign In'
    current_path.should == user_root_path
  end

  scenario "Unsuccessful Sign In" do
    fill_in 'Email', with: 'pwned@an.on'
    fill_in 'Password', with: '@ll$'
    click_on 'Sign In'
    current_path.should == user_session_path
    page.should have_content('Invalid email or password')
  end

end # feature 'Sign in'
