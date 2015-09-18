class Dweew < ActiveRecord::Migration
  def change
    add_column :users, :greating, :text
  end
end
