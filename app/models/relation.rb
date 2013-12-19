class Relation < ActiveRecord::Base

  belongs_to :itinerary
  belongs_to :subscription

  attr_accessible :itinerary_id, :subscription_id

end
