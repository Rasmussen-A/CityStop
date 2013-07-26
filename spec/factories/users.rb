# Read about factories at https://github.com/thoughtbot/factory_girl
require "factory_girl"

FactoryGirl.define do

  factory :user do
    name I18n.t(:factory_username)
    email 'bob@hula.hoop'
    password 'p@ssword'
  end

end
