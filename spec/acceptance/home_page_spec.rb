# coding: utf-8
require 'spec_helper'

feature 'Home page', %q{ As an unregistred user I want to see home page } do
  background do
    # Nothing to do here
  end
  
  scenario "Home page" do
    visit "/"
    page.should have_link('Войти')
    page.should have_link('Зарегестрироваться')
    page.should have_selector('title', :text => "CityStop")
    page.should have_content('Где это я?')
  end
end
  