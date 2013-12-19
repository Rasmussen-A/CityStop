class AddActiveAndOccurAtToSubscription < ActiveRecord::Migration
  def change
    add_column :subscriptions, :occur_at, :datetime
    add_column :subscriptions, :active, :boolean
  end
end
