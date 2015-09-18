class CreateTeches < ActiveRecord::Migration
  def change
    create_table :teches do |t|
      t.string :skills
      t.string :duration

      t.timestamps null: false
    end
  end
end
