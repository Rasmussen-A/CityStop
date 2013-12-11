class CreateRelations < ActiveRecord::Migration
  def change
    create_table :relations do |t|
      t.integer :itinerary_id
      t.integer :subscription_id

      t.timestamps
    end
  end
end
