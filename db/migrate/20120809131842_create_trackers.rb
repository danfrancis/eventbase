class CreateTrackers < ActiveRecord::Migration
  def change
    create_table :trackers do |t|
      t.string :email_frequency
      t.integer :user_id
      t.integer :tracking_id
      t.string :tracking_type

      t.timestamps
    end
  end
end
