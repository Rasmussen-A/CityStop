class RemoveOccureAtFromSubscription < ActiveRecord::Migration
  def change
    remove_column :subscriptions, :occure_at, :datetime
  end
end
