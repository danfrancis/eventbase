class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.string :attending_type
      t.integer :attending_id
      t.integer :event_id
      t.string :role

      t.timestamps
    end
  end
end
