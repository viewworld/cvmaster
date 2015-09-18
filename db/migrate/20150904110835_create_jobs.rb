class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.date :start_date
      t.date :end_date
      t.string :job_name
      t.text :description
      t.string :role
      t.string :main_tech

      t.timestamps null: false
    end
  end
end
