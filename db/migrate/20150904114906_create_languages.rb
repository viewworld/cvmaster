class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.string :language
      t.string :level
      t.string :user_id
      t.string :integer

      t.timestamps null: false
    end
  end
end
