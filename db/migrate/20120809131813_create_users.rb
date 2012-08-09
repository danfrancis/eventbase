class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.integer :sign_in_times
      t.datetime :last_login
      t.boolean :admin

      t.timestamps
    end
  end
end
