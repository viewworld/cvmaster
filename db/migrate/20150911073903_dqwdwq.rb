class Dqwdwq < ActiveRecord::Migration
  def change
    add_column :users, :form_url, :string
    remove_column :users, :token, :string
  end
end
