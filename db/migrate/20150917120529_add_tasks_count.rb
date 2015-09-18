class AddTasksCount < ActiveRecord::Migration
def self.up
    add_column :users, :projects_count, :integer, :default => 0
    
    User.reset_column_information
    User.all.each do |p|
      p.projects_count =  p.projects.length
      p.save
    end
  end

  def self.down
    remove_column :users, :projects_count
  end
end
