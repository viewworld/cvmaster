class Ffff < ActiveRecord::Migration
  def change
    add_column :users, :podio_url, :string
  end
end
