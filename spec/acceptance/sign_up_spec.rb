require 'spec_helper'

feature 'Sign up', %q{
  As unregistered user
  I want to sign up
} do

  background do
    visit root_path
    page.should have_selector('a', I18n.t(:sign_up_action))
      click_link I18n.t(:sign_up_action)
  end

  scenario 'Successful signing up' do
    # register_user is defined in spec/support/request_helpers.rb
    # It just fill the forms with given args and click button
    register_user(
      'Rogue Fali', 'this_email@is.valid',
        'someP@ss', 'someP@ss')
    current_path.should == user_root_path
    page.should have_content('Rogue Fali')
    page.should have_link(I18n.t(:my_itineraries))
  end

  scenario 'Non valid email' do
    register_user(
      'Rogue Fali', 'this.email@is_non-valid',
        'someP@ss', 'someP@ss')
    current_path.should == user_registration_path
    page.should have_content(I18n.t 'activerecord.errors.messages.invalid')
  end

  scenario 'Wrong password repeat' do
    register_user(
      'Rogue Fali', 'valid@email.com',
        'someP@ss', 'somePAAss')
    current_path.should == user_registration_path
    page.should have_content(I18n.t 'activerecord.errors.messages.confirmation')
  end

  scenario 'Already exist username' do
    FactoryGirl.create(:user)
    register_user(
      I18n.t(:factory_username), 'valid@email.ork',
        'someP@ss', 'someP@ss')
    page.should have_content(I18n.t 'activerecord.errors.messages.taken')
  end

  scenario 'Already taken email' do
    FactoryGirl.create(:user)
    register_user(
      'Rogue Fail', 'bob@hula.hoop',
        'someP@ss', 'someP@ss')
    page.should have_content(I18n.t 'activerecord.errors.messages.taken')
  end

end # feature Sign up
