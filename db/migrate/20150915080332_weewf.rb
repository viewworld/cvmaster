class Weewf < ActiveRecord::Migration
  def change
    rename_column :users, :greating, :greeting
    
  end
end
