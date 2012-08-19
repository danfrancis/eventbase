class AddZipCodeToVenue < ActiveRecord::Migration
  def change
    add_column :venues, :zip_code, :string
  end
end
