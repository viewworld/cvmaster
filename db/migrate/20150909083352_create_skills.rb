class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :technology_name
      t.integer :duration
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
