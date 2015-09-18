class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.date :creation_date
      t.string :status
      t.integer :podio_id

      t.timestamps null: false
    end
  end
end
