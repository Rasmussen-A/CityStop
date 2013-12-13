class Relation < ActiveRecord::Base

  belongs_to :itinerary
  belongs_to :subscription

end
