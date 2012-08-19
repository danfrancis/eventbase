class AddPermaNameToEvent < ActiveRecord::Migration
  def change
    add_column :events, :perma_name, :string
  end
end
