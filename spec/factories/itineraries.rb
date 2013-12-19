# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :itinerary do
    name I18n.t :factory_itinerary_name
    description I18n.t :factory_itinerary_description
    kind 'vehicular'
    occur_at '2013-04-09 18:07:15'
    count 3
    active true
    location [50.50, 43.11, 11.30, 31.06]
    user
  end
end
