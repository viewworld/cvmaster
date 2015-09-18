class Dqwqw < ActiveRecord::Migration
  def change
    rename_column :jobs, :main_tech, :main_t
  end
end
