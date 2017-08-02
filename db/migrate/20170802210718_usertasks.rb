class Usertasks < ActiveRecord::Migration
  def change
    create_table :usertasks do |t|
      t.integer :user_id
      t.integer :task_id
      end
  end
end
