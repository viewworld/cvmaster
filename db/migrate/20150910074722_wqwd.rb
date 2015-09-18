class Wqwd < ActiveRecord::Migration
  def change
    add_column :users, :visible_summaries, :boolean
    add_column :users, :visible_skills, :boolean
    add_column :users, :visible_teches, :boolean
    add_column :users, :visible_projects, :boolean
    add_column :users, :visible_languages, :boolean
    add_column :users, :visible_jobs, :boolean
    remove_column :jobs, :visible
    remove_column :teches, :visible
    remove_column :sums, :visible
    remove_column :languages, :visible
    remove_column :projects, :visible
    drop_table :langueges
  end
end
