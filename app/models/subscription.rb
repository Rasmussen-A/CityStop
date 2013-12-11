class Subscription < ActiveRecord::Base

  serialize :location, JSON

  belongs_to :user
  has_one :itinerary, through: :relation

  attr_accessible :description, :name, :occur_at, :count

end
