class Dwfe < ActiveRecord::Migration
  def change
    rename_column :skills, :skills, :skill_name
  end
end
