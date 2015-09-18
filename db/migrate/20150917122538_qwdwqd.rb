class Qwdwqd < ActiveRecord::Migration
  def change
    add_column :users, :skills_order, :string
    add_column :users, :projects_order, :string
    add_column :users, :jobs_order, :string
    add_column :users, :languages_order, :string
    add_column :users, :teches_order, :string
  end
end
