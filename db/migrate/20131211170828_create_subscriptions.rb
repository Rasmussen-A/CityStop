class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.string :description
      t.datetime :occure_at
      t.string :kind
      t.string :location

      t.timestamps
    end
  end
end
