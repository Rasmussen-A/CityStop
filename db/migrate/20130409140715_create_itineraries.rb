class CreateItineraries < ActiveRecord::Migration
  def change
    create_table :itineraries do |t|
      t.string :name
      t.string :description
      t.string :kind
      t.datetime :time
      t.references :user
      # Non-native AR type, t.column :name, :type
      t.column :route, :path

      t.timestamps
    end
    add_index :itineraries, :user_id
  end
end
