class AddLocationToModels < ActiveRecord::Migration
  def change
    
    add_column :venues, :location_id, :integer
    add_column :companies, :location_id, :integer

  end
end
