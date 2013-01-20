class AddEventSeriesToEvent < ActiveRecord::Migration
  def change
    add_column :events, :event_series, :string
  end
end
