class Dwqdwq < ActiveRecord::Migration
  def change
    remove_column :jobs, :end_date
    remove_column :jobs, :start_date
    remove_column :projects, :end_date
    remove_column :projects, :start_date
    add_column :jobs, :end_date, :string 
    add_column :jobs, :start_date, :string 
    add_column :projects, :end_date, :string 
    add_column :projects, :start_date, :string 
  end
end
