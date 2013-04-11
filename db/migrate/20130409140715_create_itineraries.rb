class CreateItineraries < ActiveRecord::Migration
  def change
    create_table :itineraries do |t|
      t.string :name
      t.string :description
      t.string :type
      t.datetime :time
      t.references :user

      t.timestamps
    end
    add_index :itineraries, :user_id
  end
end
