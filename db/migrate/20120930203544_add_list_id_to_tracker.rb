class AddListIdToTracker < ActiveRecord::Migration
  def change
    add_column :trackers, :list_id, :integer
  end
end
