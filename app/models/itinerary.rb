# models#itinerary
class Itinerary < ActiveRecord::Base

  serialize :location, JSON

  belongs_to :user
  has_many :relations
  has_many :subscriptions, through: :relations, dependent: :destroy

  attr_accessible :description, :name, :occur_at, :count, :kind, :location

  validates :name, :occur_at, presence: true
  # Itinerary must have only one type from the array below
  #validates :kind,
  #  inclusion: { in: %w{ cycle vehicular } }

end
