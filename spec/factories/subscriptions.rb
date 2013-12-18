# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :subscription do
    description "Join at square"
    occure_at "2013-12-11 21:08:28"
    kind "pedestrian"
    location [50.1442, 38.3452]
  end
end
