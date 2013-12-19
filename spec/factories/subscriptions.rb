# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :subscription do
    description "Join at square"
    occur_at "2013-12-11 21:08:28"
    kind "pedestrian"
    active true
    location [50.1442, 38.3452]
    user
    itinerary
  end
end
