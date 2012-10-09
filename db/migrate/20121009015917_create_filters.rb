class CreateFilters < ActiveRecord::Migration
  def change
    create_table :filters do |t|
      t.string :title
      t.string :filterable_type
      t.integer :filterable_id
      t.integer :user_id

      t.timestamps
    end
  end
end
