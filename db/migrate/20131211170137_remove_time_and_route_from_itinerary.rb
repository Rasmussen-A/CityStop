class RemoveTimeAndRouteFromItinerary < ActiveRecord::Migration
  def change
    remove_column :itineraries, :time, :datetime
    remove_column :itineraries, :route, :string
  end
end
