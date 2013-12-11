# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :subscription do
    description "MyString"
    occure_at "2013-12-11 21:08:28"
    kind "MyString"
    location "MyString"
  end
end
