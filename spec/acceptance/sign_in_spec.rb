require 'spec_helper'

feature 'Sign in', %q{ As an admin I want to sign in } do

  background do
    # This action is defined in support/request_helpers.rb
    click_sign_in
  end

  scenario "Clicking Sign In" do
    page.source.should have_selector("title",
      text: "CityStop | #{I18n.t :sign_in_title}")
    page.source.should have_selector('form')
  end

  scenario "Successful Sign In" do
    # Signing in existing user
    FactoryGirl.create(:user)
    # This action is defined in support/request_helpers.rb
    login_user(:user)
    current_path.should == user_root_path
  end

  scenario "Unsuccessful Sign In" do
    # Trying to sign in a God, I mean non-existing user, lol
    # Should roll back to login page
    fill_in I18n.t(:email_field), with: 'pwned@an.on'
    fill_in I18n.t(:pass_field), with: '@ll$'
    click_button I18n.t(:sign_in_action)
    current_path.should == user_session_path
    page.should have_content(
      I18n.t 'devise.failure.user.not_found_in_database')
  end

end # feature 'Sign in'
