class AddCounterCacheToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :jobs_count, :integer, :default => 0
     User.all do |user|
      user.jobs_count = user.jobs.length
      user.save
    end
  end

  def self.down
    remove_column :users, :jobs_count
  end
end
