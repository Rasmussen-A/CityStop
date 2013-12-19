class Subscription < ActiveRecord::Base

  serialize :location, JSON

  belongs_to :user
  has_one :relation
  has_one :itinerary, through: :relation

  attr_accessible :description, :occur_at, :kind, :location, :active

end
