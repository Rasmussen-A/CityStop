module RequestHelpers

  module Helpers

    def click_sign_in
      visit root_path
      click_link I18n.t :sign_in_action
    end

    def login_user(user)
      visit new_user_session_path
      fill_in I18n.t(:email_field), with: 'bob@hula.hoop'
      fill_in I18n.t(:pass_field), with: 'p@ssword'
      click_button I18n.t(:sign_in_action)
    end

  end # module Helpers

  RSpec.configure do |config|
    config.include RequestHelpers::Helpers, type: :acceptance, example_group: {
      file_path: config.escaped_path(%w[spec acceptance])}
  end

end # module RequestHelpers
