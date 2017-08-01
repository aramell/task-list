class Createlists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :name
      t.string :tasks
      t.integer :user_id
      

      end
  end
end
