class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :url
      t.string :organizer
      t.integer :venue_id
      t.datetime :event_start_date
      t.datetime :event_end_date
      t.datetime :reg_start_date
      t.datetime :reg_end_date
      t.string :reg_url
      t.string :price
      t.text :description

      t.timestamps
    end
  end
end
