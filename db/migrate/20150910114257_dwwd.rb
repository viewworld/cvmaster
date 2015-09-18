class Dwwd < ActiveRecord::Migration
  def change
    add_column :skills, :years, :integer
    add_column :teches, :years, :integer
    add_column :skills, :months, :integer
    add_column :teches, :months, :integer
    remove_column :skills, :duration 
    remove_column :teches, :duration 
  end
end
