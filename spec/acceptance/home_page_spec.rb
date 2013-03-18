feature 'Home Page', %q{
  As an unregistered user
  I want to see the home/landing page
} do
  background do
    # Nothing to do here
  end
  scenario "Home page" do
    visit "/"
    page.should have_link('Войти')
    page.should have_selector('title', :text => "CityStop")
    page.should have_content('Что это?')
  end
end