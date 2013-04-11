require 'spec_helper'

feature 'Sign in', %q{ As an admin I want to sign in } do

  background do
    click_sign_in
  end

  scenario "Clicking Sign In" do
    page.source.should have_selector("title",
      text: "CityStop | #{I18n.t :sign_in_title}")
    page.source.should have_selector('form')
  end

  scenario "Successful Sign In" do
    FactoryGirl.create(:user)
    login_user(:user)
    current_path.should == user_root_path
  end

  scenario "Unsuccessful Sign In" do
    fill_in I18n.t(:email_field), with: 'pwned@an.on'
    fill_in I18n.t(:pass_field), with: '@ll$'
    click_button I18n.t(:sign_in_action)
    current_path.should == user_session_path
    page.should have_content('Invalid email or password')
  end

end # feature 'Sign in'
