class Createusertasks < ActiveRecord::Migration
  def change
    create_table :usertasks do |t|
      t.string :user_id
      t.string :task_id
      end
  end
end
