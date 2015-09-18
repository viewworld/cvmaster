class VisibleJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :visible, :boolean
    add_column :languages, :visible, :boolean
    add_column :teches, :visible, :boolean
    add_column :projects, :visible, :boolean
    add_column :sums, :visible, :boolean
  end
end
