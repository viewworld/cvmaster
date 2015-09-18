class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.date :start_date
      t.date :end_date
      t.string :name
      t.text :description
      t.string :client
      t.integer :hours
      t.string :goal
      t.string :role
      t.string :main_t
      t.string :specific_t
      t.string :business_domain
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
