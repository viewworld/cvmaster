class Eewffew < ActiveRecord::Migration
  def change
     rename_column :teches, :skills, :technology_name
     rename_column :skills, :technology_name, :skills
  end
end
