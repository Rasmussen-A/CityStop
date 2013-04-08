# Read about factories at https://github.com/thoughtbot/factory_girl
require "factory_girl"

FactoryGirl.define do

  factory :user do
    name 'Testing'
    email 'name@domain.org'
    password 'password'
  end

end
