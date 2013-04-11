class Itinerary < ActiveRecord::Base
  belongs_to :user
  attr_accessible :description, :name, :time, :type
  validates :user, :name, presence: true
end
