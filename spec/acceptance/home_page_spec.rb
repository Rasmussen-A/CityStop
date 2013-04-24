require 'spec_helper'

feature 'Home page', %q{ As an unregistred user I want to see home page } do

  background do
    # Nothing to do here
  end

  scenario "Home page" do
    visit root_path
    page.should have_link(I18n.t :sign_in_action)
    page.should have_link(I18n.t :sign_up_action)
    page.source.should have_selector("title",
      text: "CityStop | #{I18n.t :main_title}")
    page.should have_content(I18n.t :where_am_i)
  end

end # feature 'Home page'
