class Createtasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :list_id
      end
  end
end
