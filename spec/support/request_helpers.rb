module RequestHelpers

  module Helpers

    def click_sign_in
      visit root_path
      click_link I18n.t :sign_in_action
    end

    def login_user(user)
      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in I18n.t(:pass_field), with: user.password
      click_button I18n.t(:sign_in_action)
    end

    def register_user(name, email, pass, pass_confirm)
    fill_in I18n.t(:username), with: name
    fill_in 'Email', with: email
    fill_in I18n.t(:pass_field), with: pass
    fill_in I18n.t(:pass_confirm), with: pass_confirm
      click_button I18n.t(:sign_up_action)
    end

  end # module Helpers

  RSpec.configure do |config|
    config.include RequestHelpers::Helpers, type: :acceptance, example_group: {
      file_path: config.escaped_path(%w[spec acceptance])}
  end

end # module RequestHelpers
