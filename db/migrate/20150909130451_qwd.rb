class Qwd < ActiveRecord::Migration
  def change
       rename_column :users, :login, :nickname
       add_column :users, :skype, :string
       add_column :users, :phone, :string
  end
end
