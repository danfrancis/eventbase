class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :title
      t.integer :company_id

      t.timestamps
    end
  end
end
