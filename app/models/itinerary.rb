# models#itinerary
class Itinerary < ActiveRecord::Base

  belongs_to :user
  # Attributes that user can access
  attr_accessible :description, :name, :time
  # Any Itinerary must have these fields
  validates :user, :name, :time, :route, :kind, presence: true
  # Itinerary can nesting types from array below
  # and must have one of them
  validates :kind,
    inclusion: { in: %w{ cycle pedestrian vechicular } }
  validate :pedestrian_point, :even_route_points,
    :more_than_one_point, :only_float

  # ABSTRACT CODE
  # # Any geo-point contain two coordinates
  # validate route.length, can't be odd
  # validate route.each.type == float

  GeoPoint = 2 # One geopoint has 2 coordinates

  def pedestrian_point
    errors.add(:route, 'pedestrians can have only one geopoint') if
      (kind == 'pedestrian') and (route.length != GeoPoint)
  end

  def even_route_points
    # Return if already got errors
    return unless errors.blank?
    errors.add(:route, "can't be odd") if
      route.length % GeoPoint != 0
  end

  def more_than_one_point
    return unless errors.blank?
    errors.add(:route, 'non-pedestrian kind must have at least two points') if
      (route.length < GeoPoint*2) and (kind == 'cycle' or kind == 'vechicular')
  end

  def only_float
    return unless errors.blank?
    route.each do |point|
      errors.add(:route, 'points can only be float') if
        point.class != Float
    end
  end

end
