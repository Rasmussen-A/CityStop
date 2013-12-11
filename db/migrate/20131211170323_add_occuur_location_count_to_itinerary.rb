class AddOccuurLocationCountToItinerary < ActiveRecord::Migration
  def change
    add_column :itineraries, :occur_at, :datetime
    add_column :itineraries, :location, :string
    add_column :itineraries, :count, :integer
  end
end
