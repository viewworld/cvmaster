class AddUserIdToTech < ActiveRecord::Migration
  def change
    add_column :teches, :user_id, :integer
  end
end
