class AddActiveToItinerary < ActiveRecord::Migration
  def change
    add_column :itineraries, :active, :boolean
  end
end
