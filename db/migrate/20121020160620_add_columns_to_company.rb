class AddColumnsToCompany < ActiveRecord::Migration
  def change
    
    add_column :companies, :company_perma, :string
    add_column :companies, :zipcode, :string
    add_column :companies, :country, :string
    add_column :companies, :lat, :string
    add_column :companies, :long, :string
    add_column :companies, :fb_perma, :string
    add_column :companies, :tw_perma, :string

  end
end
