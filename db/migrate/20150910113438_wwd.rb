class Wwd < ActiveRecord::Migration
  def change
    add_column :skills, :add_pdf, :boolean
  end
end
